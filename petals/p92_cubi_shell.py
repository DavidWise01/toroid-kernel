"""Petals P92: combined 26-direction cubi shell."""

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


def weight(point: tuple[int, int, int]) -> Fraction:
    return Fraction(1, sum(axis * axis for axis in point))


def main() -> None:
    shell = AXIS_POINTS + EDGE_POINTS + CORNER_POINTS
    assert (len(AXIS_POINTS), len(EDGE_POINTS), len(CORNER_POINTS), len(shell)) == (6, 12, 8, 26)
    assert all(weight(point) in (Fraction(1), Fraction(1, 2), Fraction(1, 3)) for point in shell)
    assert all(sum(point[axis] for point in shell) == 0 for axis in range(3))
    print("P92 PASS: combined 26-direction cubi shell is exact and balanced")


if __name__ == "__main__":
    main()
