"""Petals P21: deterministic 0root.ai documentation publication bundle."""
from dataclasses import dataclass
import hashlib

@dataclass(frozen=True)
class PublicationBundle:
    target: str
    llms_txt: str
    robots_txt: str
    def valid(self) -> bool:
        return (self.target == "0root.ai" and "Posi core" in self.llms_txt
                and "User-agent: *" in self.robots_txt
                and "Allow: /" in self.robots_txt
                and "execution" in self.llms_txt)
    def digest(self) -> str:
        return hashlib.sha256("|".join((self.target,self.llms_txt,self.robots_txt)).encode()).hexdigest()

def main() -> None:
    bundle=PublicationBundle("0root.ai",
        "0root.ai documentation overlay; private Posi core; no execution.",
        "User-agent: *\nAllow: /\n")
    assert bundle.valid()
    assert len(bundle.digest()) == 64
    assert bundle.digest() == bundle.digest()
    assert not PublicationBundle("other.example",bundle.llms_txt,bundle.robots_txt).valid()
    print(f"P21 PASS: publication bundle sealed {bundle.digest()[:16]}…")

if __name__ == "__main__": main()
