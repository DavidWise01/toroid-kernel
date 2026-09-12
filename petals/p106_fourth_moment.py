"""Petals P106: exact fourth-order moments of the normalized cubi shell."""

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
    return Fraction(3, 44 * sum(axis * axis for axis in point))


def main() -> None:
    radial_fourth = sum(weight(point) * sum(axis * axis for axis in point) ** 2 for point in SHELL)
    pure = sum(weight(point) * point[0] ** 4 for point in SHELL)
    mixed = sum(weight(point) * point[0] ** 2 * point[1] ** 2 for point in SHELL)
    assert radial_fourth == Fraction(81, 22)
    assert pure == Fraction(13, 22)
    assert mixed == Fraction(7, 22)
    print("P106 PASS: fourth-order cubi moments are exact")


if __name__ == "__main__":
    main()
