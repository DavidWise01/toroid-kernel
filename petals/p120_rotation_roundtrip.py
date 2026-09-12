"""Petals P120: exact outward-and-return rotation round trip."""

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


def matrix(order, signs):
    return tuple(tuple(signs[row] if column == order[row] else 0 for column in range(3)) for row in range(3))


ROTATIONS = tuple(
    matrix(order, signs)
    for order in permutations((0, 1, 2))
    for signs in product((-1, 1), repeat=3)
    if parity(order) * signs[0] * signs[1] * signs[2] == 1
)


def apply(rotation, point):
    return tuple(sum(rotation[i][j] * point[j] for j in range(3)) for i in range(3))


def inverse(rotation):
    return tuple(tuple(rotation[j][i] for j in range(3)) for i in range(3))


def main() -> None:
    for rotation in ROTATIONS:
        outward = tuple(apply(rotation, point) for point in SHELL) + (BOUNDARY,)
        returned = tuple(apply(inverse(rotation), point) for point in outward[:-1]) + (outward[-1],)
        assert returned == SHELL + (BOUNDARY,)
    print("P120 PASS: all 24 rotated boundary rings return exactly home")


if __name__ == "__main__":
    main()
