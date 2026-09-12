"""Petals P98: cyclic closure of the ternary phase register."""


STATE_COUNT = 27
PHASE_COUNT = 3
PHASE_REGISTER = tuple(index % PHASE_COUNT for index in range(STATE_COUNT))


def next_phase(phase: int) -> int:
    return (phase + 1) % PHASE_COUNT


def main() -> None:
    wrapped = PHASE_REGISTER + (PHASE_REGISTER[0],)
    assert len(PHASE_REGISTER) == STATE_COUNT
    assert all(wrapped[index + 1] == next_phase(wrapped[index]) for index in range(STATE_COUNT))
    assert wrapped[-2:] == (2, 0)
    assert next_phase(2) == 0
    print("P98 PASS: ternary phase register closes through 2-to-0 wrap")


if __name__ == "__main__":
    main()
