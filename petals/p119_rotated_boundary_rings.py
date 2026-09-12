"""Petals P119: 26-node rotated cycles with a fixed 26.5 boundary state."""

from fractions import Fraction
from itertools import permutations, product


SHELL = tuple(
    (x, y, z)
    for x in (-1, 0, 1)
    for y in (-1, 0, 1)
    for z in (-1, 0, 1)
    if (x, y, z) != (0, 0, 0)
)
BOUNDARY = ("phase_boundary", Fraction(53, 2))


def parity(order: tuple[int, int, int]) -> int:
    inversions = sum(order[i] > order[j] for i in range(3) for j in range(i + 1, 3))
    return -1 if inversions % 2 else 1


ROTATIONS = tuple(
    (order, signs)
    for order in permutations((0, 1, 2))
    for signs in product((-1, 1), repeat=3)
    if parity(order) * signs[0] * signs[1] * signs[2] == 1
)


def rotate(point, rotation):
    order, signs = rotation
    return tuple(signs[i] * point[order[i]] for i in range(3))


def boundary_ring(rotation):
    return tuple(rotate(point, rotation) for point in SHELL) + (BOUNDARY,)


def main() -> None:
    shell_set = set(SHELL)
    assert len(ROTATIONS) == 24
    for rotation in ROTATIONS:
        ring = boundary_ring(rotation)
        closed = ring + (ring[0],)
        assert len(ring) == 27
        assert len(set(ring[:-1])) == 26
        assert set(ring[:-1]) == shell_set
        assert ring[-1] == BOUNDARY
        assert BOUNDARY not in ring[:-1]
        assert closed[0] == closed[-1]
    print("P119 PASS: all 24 rotated routes form closed 27-state boundary rings")


if __name__ == "__main__":
    main()
