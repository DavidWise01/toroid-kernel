"""Petals P8: validated host manifest for a future Posi runtime.

Validation only: no process start, GPU use, port opening, or peer connection.
"""
from dataclasses import dataclass

@dataclass(frozen=True)
class PosiHost:
    host_id: str
    cpu_cores: int
    memory_mb: int
    storage_mb: int
    gpu_enabled: bool = False
    network_enabled: bool = False

    def valid(self) -> bool:
        return (bool(self.host_id) and self.cpu_cores >= 1
                and self.memory_mb >= 256 and self.storage_mb >= 128
                and not self.gpu_enabled and not self.network_enabled)

def main() -> None:
    safe_host = PosiHost("host.home", 4, 4096, 1024)
    assert safe_host.valid()
    assert not PosiHost("host.gpu", 4, 4096, 1024, gpu_enabled=True).valid()
    assert not PosiHost("host.net", 4, 4096, 1024, network_enabled=True).valid()
    assert not PosiHost("host.small", 0, 128, 64).valid()
    print("P8 PASS: Posi host manifest validates; GPU and network default OFF")

if __name__ == "__main__":
    main()
