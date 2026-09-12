"""Petals P12: final release lock for the Posi host contract."""
from dataclasses import dataclass

@dataclass(frozen=True)
class ReleaseLock:
    peer_approved: bool
    lease_valid: bool
    host_valid: bool
    bundle_valid: bool
    receipt_valid: bool

    def ready(self) -> bool:
        return all((self.peer_approved, self.lease_valid, self.host_valid,
                    self.bundle_valid, self.receipt_valid))

def main() -> None:
    assert ReleaseLock(True, True, True, True, True).ready()
    assert not ReleaseLock(True, True, True, True, False).ready()
    assert not ReleaseLock(True, True, False, True, True).ready()
    print("P12 PASS: Posi release lock requires every safety gate")

if __name__ == "__main__":
    main()
