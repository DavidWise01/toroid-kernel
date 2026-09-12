"""Petals P114: normalized icosahedral second-moment check."""

from math import isclose, sqrt

PHI = (1 + sqrt(5)) / 2
RADIUS_SQUARED = PHI + 2
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
    moment = tuple(
        tuple(sum(point[i] * point[j] / RADIUS_SQUARED for point in POINTS) for j in range(3))
        for i in range(3)
    )
    expected = 4.0
    assert all(isclose(moment[i][i], expected, rel_tol=1e-12) for i in range(3))
    assert all(isclose(moment[i][j], 0.0, abs_tol=1e-12) for i in range(3) for j in range(3) if i != j)
    print("P114 PASS: normalized icosahedral layer is second-order isotropic")


if __name__ == "__main__":
    main()
