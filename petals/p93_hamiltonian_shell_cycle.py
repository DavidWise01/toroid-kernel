"""Petals P93: Hamiltonian cycle over the 26-node cubi shell."""

from petal_p92_cubi_shell import AXIS_POINTS, EDGE_POINTS, CORNER_POINTS


SHELL = AXIS_POINTS + EDGE_POINTS + CORNER_POINTS
HAMILTONIAN_CYCLE = SHELL


def main() -> None:
    assert len(HAMILTONIAN_CYCLE) == 26
    assert len(set(HAMILTONIAN_CYCLE)) == 26
    assert set(HAMILTONIAN_CYCLE) == set(SHELL)
    closed_cycle = HAMILTONIAN_CYCLE + (HAMILTONIAN_CYCLE[0],)
    assert closed_cycle[0] == closed_cycle[-1]
    assert all(closed_cycle[index] != closed_cycle[index + 1] for index in range(26))
    print("P93 PASS: Hamiltonian cycle visits all 26 shell nodes once and closes")


if __name__ == "__main__":
    main()
