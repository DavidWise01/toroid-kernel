"""Petals P126: deterministic state root for the verified Posi shell protocol."""

import json
from hashlib import sha256


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


def encode(state: dict) -> bytes:
    return json.dumps(state, sort_keys=True, separators=(",", ":")).encode("utf-8")


def state_root(state: dict) -> str:
    return sha256(encode(state)).hexdigest()


def main() -> None:
    first = state_root(STATE)
    reordered = dict(reversed(tuple(STATE.items())))
    mutated = dict(STATE, double_cycle_hops=11)
    assert first == state_root(reordered)
    assert first != state_root(mutated)
    assert len(first) == 64
    print(f"P126 PASS: deterministic state root {first}")


if __name__ == "__main__":
    main()
