"""Petals P128: one integrated, fail-closed Posi runtime tick."""

import json
from hashlib import sha256


SEALED_ROOT = "a5807fe3076a865bb16b32794e7ba4972e195c8e9eeb259e06a48ae78de6d71c"
STATE = {
    "boundary": "53/2",
    "cubi_nodes": 26,
    "decision_threshold": 2,
    "double_cycle_hops": 12,
    "icosahedral_nodes": 12,
    "phase_count": 3,
    "rotation_count": 24,
    "witness_count": 3,
}
SHELL = frozenset(
    (x, y, z)
    for x in (-1, 0, 1)
    for y in (-1, 0, 1)
    for z in (-1, 0, 1)
    if (x, y, z) != (0, 0, 0)
)
GENESIS = "0" * 64


def state_root(state: dict) -> str:
    payload = json.dumps(state, sort_keys=True, separators=(",", ":")).encode()
    return sha256(payload).hexdigest()


def trace_invariant(trace) -> bool:
    return len(trace) == 13 and all(node in SHELL for node in trace) and trace[0] == trace[6] == trace[12]


def quorum(trace) -> bool:
    votes = (trace_invariant(trace), trace_invariant(trace), trace_invariant(trace))
    return sum(votes) >= STATE["decision_threshold"]


def append_record(ledger: tuple[dict, ...], accepted: bool) -> tuple[dict, ...]:
    previous = ledger[-1]["digest"] if ledger else GENESIS
    sequence = len(ledger)
    payload = f"{sequence}|tick|{int(accepted)}|{previous}"
    record = {
        "sequence": sequence,
        "accepted": accepted,
        "previous": previous,
        "digest": sha256(payload.encode()).hexdigest(),
    }
    return ledger + (record,)


def ledger_valid(ledger: tuple[dict, ...]) -> bool:
    previous = GENESIS
    for index, record in enumerate(ledger):
        payload = f"{index}|tick|{int(record['accepted'])}|{previous}"
        if record["sequence"] != index or record["previous"] != previous:
            return False
        if record["digest"] != sha256(payload.encode()).hexdigest():
            return False
        previous = record["digest"]
    return True


def runtime_tick(trace, state=STATE) -> tuple[str, tuple[dict, ...]]:
    if state_root(state) != SEALED_ROOT:
        return "halt", ()
    accepted = quorum(trace)
    ledger = append_record((), accepted)
    status = "ready" if accepted and ledger_valid(ledger) else "halt"
    return status, ledger


def main() -> None:
    home = (1, 0, 0)
    valid = (
        home, (0, 1, 0), (-1, 0, 0), (0, -1, 0), (-1, 0, 0), (0, 1, 0), home,
        (0, 1, 0), (-1, 0, 0), (0, -1, 0), (-1, 0, 0), (0, 1, 0), home,
    )
    invalid = valid[:12] + ((2, 0, 0),)
    assert runtime_tick(valid)[0] == "ready"
    assert runtime_tick(invalid)[0] == "halt"
    assert runtime_tick(valid, dict(STATE, double_cycle_hops=11))[0] == "halt"
    print("P128 PASS: integrated tick starts exact, witnesses, records, and fails closed")


if __name__ == "__main__":
    main()
