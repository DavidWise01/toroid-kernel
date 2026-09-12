"""Petals P94: exact 26.5 phase-change boundary."""

from fractions import Fraction


BOUNDARY = Fraction(53, 2)
INNER_COUNT = 26
OUTER_LIMIT = 27


def phase_for(position: Fraction) -> str:
    if position < BOUNDARY:
        return "shell"
    if position == BOUNDARY:
        return "boundary"
    return "next_shell"


def main() -> None:
    assert BOUNDARY == Fraction(26.5)
    assert Fraction(INNER_COUNT) < BOUNDARY < Fraction(OUTER_LIMIT)
    assert phase_for(Fraction(26)) == "shell"
    assert phase_for(BOUNDARY) == "boundary"
    assert phase_for(Fraction(27)) == "next_shell"
    print("P94 PASS: exact 26.5 phase boundary is bounded and ordered")


if __name__ == "__main__":
    main()
