"""Petals P99: signed ternary phase balance across the 27-state ring."""


STATE_COUNT = 27
PHASE_VALUES = (-1, 0, 1)
SIGNED_RING = tuple(PHASE_VALUES[index % 3] for index in range(STATE_COUNT))


def main() -> None:
    assert len(SIGNED_RING) == STATE_COUNT
    assert all(sum(SIGNED_RING[start:start + 3]) == 0 for start in range(0, STATE_COUNT, 3))
    assert sum(SIGNED_RING) == 0
    assert SIGNED_RING[-1] == 1
    assert SIGNED_RING[0] == -1
    print("P99 PASS: signed ternary ring is neutral across all nine cycles")


if __name__ == "__main__":
    main()
