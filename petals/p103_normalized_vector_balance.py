"""Petals P103: normalized shell preserves exact vector balance."""

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


def normalized_weight(point: tuple[int, int, int]) -> Fraction:
    return Fraction(3, 44 * sum(axis * axis for axis in point))


def main() -> None:
    total = sum(normalized_weight(point) for point in SHELL)
    vector = tuple(sum(normalized_weight(point) * point[axis] for point in SHELL) for axis in range(3))
    assert total == Fraction(1)
    assert vector == (Fraction(0), Fraction(0), Fraction(0))
    print("P103 PASS: normalized shell has unit total and zero vector sum")


if __name__ == "__main__":
    main()
