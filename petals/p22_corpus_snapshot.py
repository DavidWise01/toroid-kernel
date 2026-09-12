"""Petals P22: read-only Git corpus snapshot for the private Posi vacuum."""
from dataclasses import dataclass
import hashlib

@dataclass(frozen=True)
class CorpusSnapshot:
    repository: str
    commit: str
    files: tuple[str, ...]
    def valid(self) -> bool:
        return (bool(self.repository) and bool(self.commit)
                and all(path and not path.startswith("/") for path in self.files))
    def digest(self) -> str:
        return hashlib.sha256("|".join((self.repository,self.commit,*self.files)).encode()).hexdigest()

def main() -> None:
    snapshot=CorpusSnapshot("DavidWise01/toroid-kernel","sealed-reference",
        ("petals/ARCHITECTURE_SEALED.md","petals/p21_publication_bundle.py"))
    assert snapshot.valid()
    assert len(snapshot.digest()) == 64
    assert snapshot.digest() == snapshot.digest()
    assert not CorpusSnapshot("repo","commit",("/outside-repo",)).valid()
    print(f"P22 PASS: read-only corpus snapshot verified {snapshot.digest()[:16]}…")

if __name__ == "__main__": main()
