"""Petals P91: exact cubi edge-direction shell."""

from fractions import Fraction


EDGE_POINTS = tuple(
    point
    for zero in range(3)
    for a in (-1, 1)
    for b in (-1, 1)
    for point in (
        (0, a, b) if zero == 0 else
        (a, 0, b) if zero == 1 else
        (a, b, 0),
    )
)


def inverse_square_weight(point: tuple[int, int, int]) -> Fraction:
    radius_squared = sum(axis * axis for axis in point)
    if radius_squared != 2:
        raise ValueError("edge point must lie at squared radius 2")
    return Fraction(1, radius_squared)


def main() -> None:
    assert len(EDGE_POINTS) == 12
    assert all(sum(axis * axis for axis in point) == 2 for point in EDGE_POINTS)
    assert all(inverse_square_weight(point) == Fraction(1, 2) for point in EDGE_POINTS)
    assert sum(point[0] for point in EDGE_POINTS) == 0
    assert sum(point[1] for point in EDGE_POINTS) == 0
    assert sum(point[2] for point in EDGE_POINTS) == 0
    print("P91 PASS: twelve-point cubi edge shell is exact and balanced")


if __name__ == "__main__":
    main()
