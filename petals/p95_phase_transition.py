"""Petals P95: ordered transition across the 26.5 boundary."""

from fractions import Fraction


SHELL_END = Fraction(26)
BOUNDARY = Fraction(53, 2)
NEXT_SHELL = Fraction(27)


def transition(position: Fraction) -> tuple[str, Fraction]:
    if position == SHELL_END:
        return ("shell_end", BOUNDARY)
    if position == BOUNDARY:
        return ("phase_boundary", NEXT_SHELL)
    if position == NEXT_SHELL:
        return ("next_shell_start", NEXT_SHELL)
    raise ValueError("position is outside the P95 transition states")


def main() -> None:
    first_label, first_target = transition(SHELL_END)
    boundary_label, boundary_target = transition(first_target)
    final_label, final_target = transition(boundary_target)
    assert first_label == "shell_end"
    assert boundary_label == "phase_boundary"
    assert final_label == "next_shell_start"
    assert first_target == BOUNDARY
    assert boundary_target == NEXT_SHELL
    assert final_target == NEXT_SHELL
    assert SHELL_END < BOUNDARY < NEXT_SHELL
    print("P95 PASS: shell-to-shell transition crosses 26.5 exactly")


if __name__ == "__main__":
    main()
