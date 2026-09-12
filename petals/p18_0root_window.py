"""Petals P18: read-only 0root.ai observation window policy.

Laptop remains authoritative. Policy only; no HTTP request or deployment.
"""
from dataclasses import dataclass

@dataclass(frozen=True)
class WindowPolicy:
    authority: str = "laptop:0root"
    target: str = "0root.ai"
    read_only: bool = True
    enabled: bool = False

    def permits(self, domain: str, operation: str) -> bool:
        return (self.enabled and self.read_only and domain == self.target
                and operation == "observe")

def main() -> None:
    closed = WindowPolicy()
    assert not closed.permits("0root.ai", "observe")
    assert not closed.permits("0root.ai", "write")
    window = WindowPolicy(enabled=True)
    assert window.permits("0root.ai", "observe")
    assert not window.permits("0root.ai", "write")
    assert not window.permits("unknown.example", "observe")
    assert window.authority == "laptop:0root"
    print("P18 PASS: 0root.ai observation window is exact, read-only, and opt-in")

if __name__ == "__main__":
    main()
