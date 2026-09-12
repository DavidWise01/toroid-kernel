"""Petals P113: numerical projection of the exact phi shell."""

from math import isclose, sqrt

PHI = (1 + sqrt(5)) / 2
POINTS = tuple(
    point
    for sa in (-1, 1)
    for sb in (-1, 1)
    for point in (
        (0.0, float(sa), float(sb) * PHI),
        (float(sa), float(sb) * PHI, 0.0),
        (float(sb) * PHI, 0.0, float(sa)),
    )
)


def main() -> None:
    radii_squared = tuple(sum(value * value for value in point) for point in POINTS)
    vector = tuple(sum(point[axis] for point in POINTS) for axis in range(3))
    expected_radius_squared = PHI + 2
    assert len(POINTS) == 12
    assert all(isclose(value, expected_radius_squared, rel_tol=1e-12) for value in radii_squared)
    assert all(isclose(value, 0.0, abs_tol=1e-12) for value in vector)
    print("P113 PASS: numeric phi projection preserves radius and balance")


if __name__ == "__main__":
    main()
