"""Petals P101: exact scalar total of the inverse-square cubi shell."""

from fractions import Fraction


AXIS_COUNT = 6
EDGE_COUNT = 12
CORNER_COUNT = 8


def shell_potential() -> Fraction:
    return (
        AXIS_COUNT * Fraction(1, 1)
        + EDGE_COUNT * Fraction(1, 2)
        + CORNER_COUNT * Fraction(1, 3)
    )


def main() -> None:
    potential = shell_potential()
    assert potential == Fraction(44, 3)
    assert potential > 0
    print(f"P101 PASS: scalar shell potential = {potential}")


if __name__ == "__main__":
    main()
