"""Petals P122: two six-hop cycles with returns at hops 6 and 12."""

from itertools import permutations, product


SHELL = tuple(
    (x, y, z)
    for x in (-1, 0, 1)
    for y in (-1, 0, 1)
    for z in (-1, 0, 1)
    if (x, y, z) != (0, 0, 0)
)


def parity(order):
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


def double_cycle(point, rotation):
    state = point
    trace = [state]
    for _ in range(2):
        for _ in range(3):
            state = apply(rotation, state)
            trace.append(state)
        for _ in range(3):
            state = apply(inverse(rotation), state)
            trace.append(state)
    return tuple(trace)


def main() -> None:
    for rotation in ROTATIONS:
        for point in SHELL:
            trace = double_cycle(point, rotation)
            assert len(trace) == 13
            assert trace[0] == trace[6] == trace[12]
            assert all(state in SHELL for state in trace)
    print("P122 PASS: two six-hop cycles return home at hops 6 and 12")


if __name__ == "__main__":
    main()
