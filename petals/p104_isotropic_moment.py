"""Petals P104: exact second-order isotropy of the normalized shell."""

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
    moment = tuple(
        tuple(sum(weight(point) * point[i] * point[j] for point in SHELL) for j in range(3))
        for i in range(3)
    )
    expected = Fraction(13, 22)
    assert moment == ((expected, 0, 0), (0, expected, 0), (0, 0, expected))
    print("P104 PASS: normalized shell has exact isotropic second moment")


if __name__ == "__main__":
    main()
