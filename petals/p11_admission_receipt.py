"""Petals P11: deterministic audit receipt for Posi admission."""
from dataclasses import dataclass
import hashlib

@dataclass(frozen=True)
class AdmissionReceipt:
    host_id: str
    peer: str
    bytes_granted: int
    seconds_granted: int
    bundle_digest: str

    def valid(self) -> bool:
        return (bool(self.host_id) and bool(self.peer)
                and self.bytes_granted >= 0
                and self.seconds_granted >= 0
                and bool(self.bundle_digest))

    def digest(self) -> str:
        fields = (self.host_id, self.peer, str(self.bytes_granted),
                  str(self.seconds_granted), self.bundle_digest)
        return hashlib.sha256("|".join(fields).encode()).hexdigest()

def main() -> None:
    receipt = AdmissionReceipt("host.home", "peer.home", 512, 10, "sha256:posi")
    assert receipt.valid()
    assert len(receipt.digest()) == 64
    assert receipt.digest() == receipt.digest()
    assert not AdmissionReceipt("", "peer.home", -1, 10, "").valid()
    print(f"P11 PASS: deterministic admission receipt {receipt.digest()[:16]}…")

if __name__ == "__main__":
    main()
