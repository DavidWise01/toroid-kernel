"""Petals P111: composite cubi plus exact icosahedral shell."""

from petal_p110_exact_phi_icosahedron import ICO_POINTS, ZERO


AXIS_POINTS = ((1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1))
EDGE_POINTS = tuple(
    point
    for zero in range(3)
    for a in (-1, 1)
    for b in (-1, 1)
    for point in ((0, a, b) if zero == 0 else (a, 0, b) if zero == 1 else (a, b, 0),)
)
CORNER_POINTS = tuple((x, y, z) for x in (-1, 1) for y in (-1, 1) for z in (-1, 1))
CUBI_SHELL = AXIS_POINTS + EDGE_POINTS + CORNER_POINTS


def main() -> None:
    cubi_balance = tuple(sum(point[axis] for point in CUBI_SHELL) for axis in range(3))
    ico_balance = tuple(sum((point[axis] for point in ICO_POINTS), ZERO) for axis in range(3))
    assert len(CUBI_SHELL) == 26
    assert len(ICO_POINTS) == 12
    assert len(CUBI_SHELL) + len(ICO_POINTS) == 38
    assert cubi_balance == (0, 0, 0)
    assert ico_balance == (ZERO, ZERO, ZERO)
    print("P111 PASS: 38-direction composite shell remains exactly balanced")


if __name__ == "__main__":
    main()
