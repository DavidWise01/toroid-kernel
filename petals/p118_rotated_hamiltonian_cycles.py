"""Petals P118: Hamiltonian shell cycle preserved by all cubic rotations."""

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


def rotate(point, rotation):
    order, signs = rotation
    return tuple(signs[i] * point[order[i]] for i in range(3))


def main() -> None:
    shell_set = set(SHELL)
    for rotation in ROTATIONS:
        cycle = tuple(rotate(point, rotation) for point in SHELL)
        closed = cycle + (cycle[0],)
        assert len(cycle) == 26
        assert len(set(cycle)) == 26
        assert set(cycle) == shell_set
        assert closed[0] == closed[-1]
    print("P118 PASS: all 24 rotated Hamiltonian shell cycles cover and close")


if __name__ == "__main__":
    main()
