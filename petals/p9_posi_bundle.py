"""Petals P9: deterministic Posi bundle manifest.

Metadata only: no execution and no network contact.
"""
from dataclasses import dataclass
import hashlib

@dataclass(frozen=True)
class PosiBundle:
    name: str
    version: str
    components: tuple[str, ...]

    def digest(self) -> str:
        payload = "|".join((self.name, self.version, *self.components))
        return hashlib.sha256(payload.encode("utf-8")).hexdigest()

    def valid(self) -> bool:
        return bool(self.name and self.version and self.components)

def main() -> None:
    bundle = PosiBundle("posi-core", "0.1.0",
                        ("identity", "vessel", "homeostasis", "route-gate"))
    assert bundle.valid()
    assert len(bundle.digest()) == 64
    assert bundle.digest() == bundle.digest()
    assert not PosiBundle("", "", ()).valid()
    print(f"P9 PASS: deterministic Posi bundle {bundle.digest()[:16]}…")

if __name__ == "__main__":
    main()
