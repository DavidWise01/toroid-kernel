"""Petals P90: smallest exact spherical shell around a cubi center."""

from fractions import Fraction


AXIS_POINTS = ((1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1))


def inverse_square_weight(point: tuple[int, int, int]) -> Fraction:
    radius_squared = sum(axis * axis for axis in point)
    if radius_squared != 1:
        raise ValueError("shell point must lie at unit radius")
    return Fraction(1, radius_squared)


def main() -> None:
    assert len(AXIS_POINTS) == 6
    assert all(sum(axis * axis for axis in point) == 1 for point in AXIS_POINTS)
    assert all(inverse_square_weight(point) == 1 for point in AXIS_POINTS)
    assert sum(point[0] for point in AXIS_POINTS) == 0
    assert sum(point[1] for point in AXIS_POINTS) == 0
    assert sum(point[2] for point in AXIS_POINTS) == 0
    print("P90 PASS: six-point unit sphere shell is exact and balanced")


if __name__ == "__main__":
    main()
