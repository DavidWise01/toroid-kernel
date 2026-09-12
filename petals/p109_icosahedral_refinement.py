"""Petals P109: exact icosahedral refinement layer."""

# Coordinate sign patterns for the 12 icosahedral vertices.
# Interpret the nonzero entries as the two magnitudes 1 and phi.
ICO_POINTS = tuple(
    point
    for sign_a in (-1, 1)
    for sign_b in (-1, 1)
    for point in (
        (0, sign_a, sign_b),
        (sign_a, sign_b, 0),
        (sign_b, 0, sign_a),
    )
)


def main() -> None:
    assert len(ICO_POINTS) == 12
    assert len(set(ICO_POINTS)) == 12
    assert all((-point[0], -point[1], -point[2]) in ICO_POINTS for point in ICO_POINTS)
    assert all(sum(point[axis] for point in ICO_POINTS) == 0 for axis in range(3))
    print("P109 PASS: 12-point icosahedral refinement is paired and balanced")


if __name__ == "__main__":
    main()
