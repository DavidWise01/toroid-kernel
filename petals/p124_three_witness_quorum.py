"""Petals P124: three witnesses, two agreements, one cycle decision."""


SHELL = frozenset(
    (x, y, z)
    for x in (-1, 0, 1)
    for y in (-1, 0, 1)
    for z in (-1, 0, 1)
    if (x, y, z) != (0, 0, 0)
)


def invariant(trace) -> bool:
    return len(trace) == 13 and all(state in SHELL for state in trace) and trace[0] == trace[6] == trace[12]


def decide(votes: tuple[bool, bool, bool]) -> bool:
    return sum(votes) >= 2


def main() -> None:
    home = (1, 0, 0)
    valid = (home, (0, 1, 0), (-1, 0, 0), (0, -1, 0),
             (-1, 0, 0), (0, 1, 0), home,
             (0, 1, 0), (-1, 0, 0), (0, -1, 0),
             (-1, 0, 0), (0, 1, 0), home)
    invalid = valid[:12] + ((0, 1, 0),)
    valid_vote = invariant(valid)
    invalid_vote = invariant(invalid)
    assert decide((valid_vote, valid_vote, False))
    assert not decide((invalid_vote, invalid_vote, True))
    assert decide((True, True, True))
    assert not decide((False, False, False))
    print("P124 PASS: 3-witness quorum tolerates one faulty vote")


if __name__ == "__main__":
    main()
