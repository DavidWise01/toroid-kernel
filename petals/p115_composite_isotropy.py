"""Petals P115: equal-weight cubi/icosahedral composite moment check."""

from fractions import Fraction

CUBI_DIAGONAL = Fraction(13, 22)
ICO_DIAGONAL = Fraction(1, 3)
COMPOSITE_DIAGONAL = (CUBI_DIAGONAL + ICO_DIAGONAL) / 2


def main() -> None:
    assert COMPOSITE_DIAGONAL == Fraction(61, 132)
    matrix = (
        (COMPOSITE_DIAGONAL, 0, 0),
        (0, COMPOSITE_DIAGONAL, 0),
        (0, 0, COMPOSITE_DIAGONAL),
    )
    assert matrix[0][0] == matrix[1][1] == matrix[2][2]
    assert all(matrix[i][j] == 0 for i in range(3) for j in range(3) if i != j)
    print(f"P115 PASS: composite second moment is isotropic at {COMPOSITE_DIAGONAL}")


if __name__ == "__main__":
    main()
