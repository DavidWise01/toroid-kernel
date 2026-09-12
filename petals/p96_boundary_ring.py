"""Petals P96: 26 shell nodes plus one 26.5 phase node."""

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
BOUNDARY = ("phase_boundary", Fraction(53, 2))
RING = SHELL + (BOUNDARY,)


def main() -> None:
    assert len(SHELL) == 26
    assert len(RING) == 27
    assert len(set(SHELL)) == 26
    assert RING[-1] == BOUNDARY
    closed_ring = RING + (RING[0],)
    assert closed_ring[0] == RING[0]
    assert closed_ring[-1] == RING[0]
    assert all(closed_ring[i] != closed_ring[i + 1] for i in range(27))
    print("P96 PASS: 27-state ring includes 26.5 boundary and closes")


if __name__ == "__main__":
    main()
