"""Petals P10: admission gate for a future Posi host.

Pure decision function: no startup, hardware access, or network I/O.
"""
from dataclasses import dataclass

@dataclass(frozen=True)
class Admission:
    approved_peer: str
    lease_bytes: int
    lease_seconds: int
    host_id: str
    cpu_cores: int
    memory_mb: int
    storage_mb: int
    bundle_digest: str
    gpu_enabled: bool = False
    network_enabled: bool = False

    def accepted(self, peer: str, bytes_needed: int, seconds_needed: int) -> bool:
        return (peer == self.approved_peer
                and 0 <= bytes_needed <= self.lease_bytes
                and 0 <= seconds_needed <= self.lease_seconds
                and bool(self.host_id) and self.cpu_cores >= 1
                and self.memory_mb >= 256 and self.storage_mb >= 128
                and bool(self.bundle_digest)
                and not self.gpu_enabled and not self.network_enabled)

def main() -> None:
    gate = Admission("peer.home", 1024, 30, "host.home", 4, 4096, 1024, "sha256:posi")
    assert gate.accepted("peer.home", 512, 10)
    assert not gate.accepted("peer.unknown", 512, 10)
    assert not gate.accepted("peer.home", 2048, 10)
    assert not Admission(**{**gate.__dict__, "gpu_enabled": True}).accepted("peer.home", 1, 1)
    print("P10 PASS: peer, lease, host, bundle, and GPU safety gates integrated")

if __name__ == "__main__":
    main()
