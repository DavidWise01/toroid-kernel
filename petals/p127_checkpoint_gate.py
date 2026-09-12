"""Petals P127: fail-closed checkpoint gate for the Posi protocol state."""

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


def state_root(state: dict) -> str:
    payload = json.dumps(state, sort_keys=True, separators=(",", ":")).encode("utf-8")
    return sha256(payload).hexdigest()


def checkpoint(state: dict) -> str:
    return "ready" if state_root(state) == SEALED_ROOT else "halt"


def main() -> None:
    changed_boundary = dict(STATE, boundary="27")
    changed_quorum = dict(STATE, decision_threshold=1)
    changed_hops = dict(STATE, double_cycle_hops=11)
    assert checkpoint(STATE) == "ready"
    assert checkpoint(changed_boundary) == "halt"
    assert checkpoint(changed_quorum) == "halt"
    assert checkpoint(changed_hops) == "halt"
    print("P127 PASS: sealed checkpoint starts exact state and halts mutations")


if __name__ == "__main__":
    main()
