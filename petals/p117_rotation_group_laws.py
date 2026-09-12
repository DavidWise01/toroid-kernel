"""Petals P117: group laws for the 24 proper cubic rotations."""

from itertools import permutations, product


def parity(order: tuple[int, int, int]) -> int:
    inversions = sum(order[i] > order[j] for i in range(3) for j in range(i + 1, 3))
    return -1 if inversions % 2 else 1


def matrix(order: tuple[int, int, int], signs: tuple[int, int, int]):
    return tuple(tuple(signs[row] if column == order[row] else 0 for column in range(3)) for row in range(3))


ROTATIONS = tuple(
    matrix(order, signs)
    for order in permutations((0, 1, 2))
    for signs in product((-1, 1), repeat=3)
    if parity(order) * signs[0] * signs[1] * signs[2] == 1
)
IDENTITY = ((1, 0, 0), (0, 1, 0), (0, 0, 1))


def multiply(left, right):
    return tuple(
        tuple(sum(left[i][k] * right[k][j] for k in range(3)) for j in range(3))
        for i in range(3)
    )


def transpose(value):
    return tuple(tuple(value[j][i] for j in range(3)) for i in range(3))


def main() -> None:
    rotation_set = set(ROTATIONS)
    assert len(rotation_set) == 24
    assert IDENTITY in rotation_set
    assert all(multiply(a, b) in rotation_set for a in ROTATIONS for b in ROTATIONS)
    assert all(multiply(rotation, transpose(rotation)) == IDENTITY for rotation in ROTATIONS)
    print("P117 PASS: 24 cubic rotations satisfy identity, closure, and inverse laws")


if __name__ == "__main__":
    main()
