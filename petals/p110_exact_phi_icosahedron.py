"""Petals P110: exact golden-ratio icosahedral coordinates."""


class Phi:
    """Exact value a + b*phi, using phi^2 = phi + 1."""

    def __init__(self, constant: int = 0, coefficient: int = 0):
        self.constant = constant
        self.coefficient = coefficient

    def __add__(self, other: "Phi") -> "Phi":
        return Phi(self.constant + other.constant, self.coefficient + other.coefficient)

    def __neg__(self) -> "Phi":
        return Phi(-self.constant, -self.coefficient)

    def __mul__(self, other: "Phi") -> "Phi":
        return Phi(
            self.constant * other.constant + self.coefficient * other.coefficient,
            self.constant * other.coefficient + self.coefficient * other.constant
            + self.coefficient * other.coefficient,
        )

    def __eq__(self, other: object) -> bool:
        return isinstance(other, Phi) and (self.constant, self.coefficient) == (other.constant, other.coefficient)


ZERO = Phi()
ONE = Phi(1)
PHI = Phi(0, 1)


def neg(point: tuple[Phi, Phi, Phi]) -> tuple[Phi, Phi, Phi]:
    return tuple(-value for value in point)


ICO_POINTS = tuple(
    point
    for sa in (-1, 1)
    for sb in (-1, 1)
    for point in (
        (ZERO, Phi(sa), Phi(sb) * PHI),
        (Phi(sa), Phi(sb) * PHI, ZERO),
        (Phi(sb) * PHI, ZERO, Phi(sa)),
    )
)


def main() -> None:
    assert len(ICO_POINTS) == 12
    assert all(neg(point) in ICO_POINTS for point in ICO_POINTS)
    radius = tuple(sum((value * value for value in point), ZERO) for point in ICO_POINTS)
    assert all(value == Phi(2, 1) for value in radius)
    vector = tuple(sum((point[axis] for point in ICO_POINTS), ZERO) for axis in range(3))
    assert vector == (ZERO, ZERO, ZERO)
    print("P110 PASS: exact phi icosahedron has radius phi+2 and zero net vector")


if __name__ == "__main__":
    main()
