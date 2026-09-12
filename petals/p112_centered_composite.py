"""Petals P112: centered 38-direction composite geometry."""

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
ORIGIN = (0, 0, 0)


def main() -> None:
    directions = CUBI_SHELL + ICO_POINTS
    assert len(directions) == 38
    assert ORIGIN not in directions
    assert all((-point[0], -point[1], -point[2]) in directions for point in directions)
    assert all(sum(point[axis] for point in CUBI_SHELL) == 0 for axis in range(3))
    assert all(sum((point[axis] for point in ICO_POINTS), ZERO) == ZERO for axis in range(3))
    assert len(directions) + 1 == 39
    print("P112 PASS: centered 39-node composite geometry is closed and balanced")


if __name__ == "__main__":
    main()
