"""Petals P7: finite resource lease.

Policy-only reference implementation. It performs no network I/O and allocates
no hardware. GPU work is disabled by default.
"""
from dataclasses import dataclass

@dataclass(frozen=True)
class ResourceLease:
    peer: str
    max_bytes: int = 0
    max_seconds: int = 0
    gpu_seconds: int = 0

    def permits(self, peer: str, bytes_requested: int, seconds: int) -> bool:
        return (peer == self.peer and bytes_requested >= 0 and seconds >= 0
                and bytes_requested <= self.max_bytes
                and seconds <= self.max_seconds)

def main() -> None:
    lease = ResourceLease("peer.home", max_bytes=1024, max_seconds=30)
    assert lease.permits("peer.home", 1024, 30)
    assert not lease.permits("peer.home", 1025, 30)
    assert not lease.permits("peer.home", 1, 31)
    assert not lease.permits("peer.unknown", 1, 1)
    assert lease.gpu_seconds == 0
    print("P7 PASS: finite lease enforced; GPU budget defaults to zero")

if __name__ == "__main__":
    main()
