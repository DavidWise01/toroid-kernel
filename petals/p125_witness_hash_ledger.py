"""Petals P125: append-only hash ledger for quorum decisions."""

from dataclasses import dataclass, replace
from hashlib import sha256

GENESIS = "0" * 64


@dataclass(frozen=True)
class Record:
    sequence: int
    cycle: str
    accepted: bool
    previous: str
    digest: str


def digest(sequence: int, cycle: str, accepted: bool, previous: str) -> str:
    payload = f"{sequence}|{cycle}|{int(accepted)}|{previous}".encode("utf-8")
    return sha256(payload).hexdigest()


def append(ledger: tuple[Record, ...], cycle: str, accepted: bool) -> tuple[Record, ...]:
    previous = ledger[-1].digest if ledger else GENESIS
    sequence = len(ledger)
    record = Record(sequence, cycle, accepted, previous, digest(sequence, cycle, accepted, previous))
    return ledger + (record,)


def valid(ledger: tuple[Record, ...]) -> bool:
    previous = GENESIS
    for sequence, record in enumerate(ledger):
        if record.sequence != sequence or record.previous != previous:
            return False
        if record.digest != digest(record.sequence, record.cycle, record.accepted, record.previous):
            return False
        previous = record.digest
    return True


def main() -> None:
    ledger = append((), "cycle-0", True)
    ledger = append(ledger, "cycle-1", False)
    ledger = append(ledger, "cycle-2", True)
    tampered = (replace(ledger[0], accepted=False),) + ledger[1:]
    assert valid(ledger)
    assert not valid(tampered)
    assert ledger[0].digest == tampered[0].digest
    assert tampered[0].digest != digest(
        tampered[0].sequence, tampered[0].cycle, tampered[0].accepted, tampered[0].previous
    )
    print("P125 PASS: append-only witness ledger detects historical tampering")


if __name__ == "__main__":
    main()
