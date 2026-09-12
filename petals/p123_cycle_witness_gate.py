"""Petals P123: witness gate for valid twelve-hop shell cycles."""


SHELL = frozenset(
    (x, y, z)
    for x in (-1, 0, 1)
    for y in (-1, 0, 1)
    for z in (-1, 0, 1)
    if (x, y, z) != (0, 0, 0)
)


def valid_trace(trace: tuple[tuple[int, int, int], ...]) -> bool:
    return (
        len(trace) == 13
        and all(state in SHELL for state in trace)
        and trace[0] == trace[6] == trace[12]
    )


def main() -> None:
    home = (1, 0, 0)
    valid = (home, (0, 1, 0), (-1, 0, 0), (0, -1, 0),
             (-1, 0, 0), (0, 1, 0), home,
             (0, 1, 0), (-1, 0, 0), (0, -1, 0),
             (-1, 0, 0), (0, 1, 0), home)
    malformed = valid[:-1]
    out_of_shell = valid[:4] + ((2, 0, 0),) + valid[5:]
    wrong_return = valid[:12] + ((0, 1, 0),)
    assert valid_trace(valid)
    assert not valid_trace(malformed)
    assert not valid_trace(out_of_shell)
    assert not valid_trace(wrong_return)
    print("P123 PASS: witness accepts valid cycle and rejects malformed traces")


if __name__ == "__main__":
    main()
