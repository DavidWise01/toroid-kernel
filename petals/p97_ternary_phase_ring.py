"""Petals P97: ternary phase register over the 27-state ring."""

from collections import Counter


STATE_COUNT = 27
PHASES = (0, 1, 2)
PHASE_REGISTER = tuple(index % 3 for index in range(STATE_COUNT))
BOUNDARY_INDEX = 26


def main() -> None:
    assert len(PHASE_REGISTER) == STATE_COUNT
    assert set(PHASE_REGISTER) == set(PHASES)
    assert Counter(PHASE_REGISTER) == Counter({0: 9, 1: 9, 2: 9})
    assert PHASE_REGISTER[BOUNDARY_INDEX] == 2
    assert PHASE_REGISTER[0] == 0
    assert all(PHASE_REGISTER[index] != PHASE_REGISTER[index + 1] for index in range(26))
    print("P97 PASS: 27-state ring carries balanced ternary phases")


if __name__ == "__main__":
    main()
