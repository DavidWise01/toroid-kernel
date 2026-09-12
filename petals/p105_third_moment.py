"""Petals P105: exact cancellation of all third-order shell moments."""

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
    moments = tuple(
        sum(weight(point) * point[i] * point[j] * point[k] for point in SHELL)
        for i in range(3)
        for j in range(3)
        for k in range(3)
    )
    assert len(moments) == 27
    assert all(moment == 0 for moment in moments)
    print("P105 PASS: all 27 third-order moments cancel exactly")


if __name__ == "__main__":
    main()
