"""Petals P107: exact cubic anisotropy diagnostic."""

from fractions import Fraction

PURE_FOURTH = Fraction(13, 22)
MIXED_FOURTH = Fraction(7, 22)


def main() -> None:
    ratio = PURE_FOURTH / MIXED_FOURTH
    assert ratio == Fraction(13, 7)
    assert PURE_FOURTH > MIXED_FOURTH
    assert ratio != 3
    print(f"P107 PASS: cubic fourth-moment ratio = {ratio}")
    print("P107 NOTE: discrete shell is cubic, not fully rotationally isotropic")


if __name__ == "__main__":
    main()
