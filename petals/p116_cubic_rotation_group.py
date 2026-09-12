"""Petals P116: closure under all 24 proper cubic rotations."""

from itertools import permutations, product


SHELL = tuple(
    (x, y, z)
    for x in (-1, 0, 1)
    for y in (-1, 0, 1)
    for z in (-1, 0, 1)
    if (x, y, z) != (0, 0, 0)
)


def parity(order: tuple[int, int, int]) -> int:
    inversions = sum(order[i] > order[j] for i in range(3) for j in range(i + 1, 3))
    return -1 if inversions % 2 else 1


ROTATIONS = tuple(
    (order, signs)
    for order in permutations((0, 1, 2))
    for signs in product((-1, 1), repeat=3)
    if parity(order) * signs[0] * signs[1] * signs[2] == 1
)


def rotate(point: tuple[int, int, int], rotation) -> tuple[int, int, int]:
    order, signs = rotation
    return tuple(signs[i] * point[order[i]] for i in range(3))


def radius_squared(point: tuple[int, int, int]) -> int:
    return sum(axis * axis for axis in point)


def main() -> None:
    shell_set = set(SHELL)
    assert len(SHELL) == 26
    assert len(ROTATIONS) == 24
    for rotation in ROTATIONS:
        rotated = tuple(rotate(point, rotation) for point in SHELL)
        assert set(rotated) == shell_set
        assert all(radius_squared(rotate(point, rotation)) == radius_squared(point) for point in SHELL)
    print("P116 PASS: all 24 proper cubic rotations preserve shell and weights")


if __name__ == "__main__":
    main()
