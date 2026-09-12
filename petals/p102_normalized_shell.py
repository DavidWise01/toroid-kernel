"""Petals P102: normalized exact weights for the 26-node shell."""

from fractions import Fraction

AXIS = Fraction(3, 44)
EDGE = Fraction(3, 88)
CORNER = Fraction(1, 44)


def main() -> None:
    total = 6 * AXIS + 12 * EDGE + 8 * CORNER
    assert total == Fraction(1)
    assert 6 * AXIS == Fraction(9, 22)
    assert 12 * EDGE == Fraction(9, 22)
    assert 8 * CORNER == Fraction(2, 11)
    assert 6 * AXIS + 12 * EDGE + 8 * CORNER == 1
    print("P102 PASS: shell weights normalize exactly to one")


if __name__ == "__main__":
    main()
