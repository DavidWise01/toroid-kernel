"""Petals P100: exact weighted vector cancellation on the 26-node shell."""

from fractions import Fraction


AXIS_POINTS = ((1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1))
EDGE_POINTS = tuple(
    point
    for zero in range(3)
    for a in (-1, 1)
    for b in (-1, 1)
    for point in ((0, a, b) if zero == 0 else (a, 0, b) if zero == 1 else (a, b, 0),)
)
CORNER_POINTS = tuple((x, y, z) for x in (-1, 1) for y in (-1, 1) for z in (-1, 1))
SHELL = AXIS_POINTS + EDGE_POINTS + CORNER_POINTS


def weight(point: tuple[int, int, int]) -> Fraction:
    return Fraction(1, sum(axis * axis for axis in point))


def main() -> None:
    field = tuple(
        sum(weight(point) * point[axis] for point in SHELL)
        for axis in range(3)
    )
    assert len(SHELL) == 26
    assert field == (Fraction(0), Fraction(0), Fraction(0))
    print("P100 PASS: exact inverse-square weighted field cancels at cubi center")


if __name__ == "__main__":
    main()
