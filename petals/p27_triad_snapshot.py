"""Petals P27: hashable three-source observation snapshot."""
from dataclasses import dataclass
import hashlib

@dataclass(frozen=True)
class SourceObservation:
    name: str
    revision: str

@dataclass(frozen=True)
class TriadSnapshot:
    observations: tuple[SourceObservation, ...]
    def valid(self) -> bool:
        return (len(self.observations)==3
                and {item.name for item in self.observations}
                == {"0root.ai","DavidWise01","rgiskard01-fiddler"}
                and all(item.revision for item in self.observations))
    def digest(self) -> str:
        payload="|".join(f"{item.name}:{item.revision}" for item in self.observations)
        return hashlib.sha256(payload.encode()).hexdigest()

def main() -> None:
    snapshot=TriadSnapshot((
        SourceObservation("0root.ai","web-llms-robots"),
        SourceObservation("DavidWise01","git-reference"),
        SourceObservation("rgiskard01-fiddler","git-reference"),
    ))
    assert snapshot.valid()
    assert len(snapshot.digest())==64
    assert snapshot.digest()==snapshot.digest()
    assert not TriadSnapshot(snapshot.observations[:2]).valid()
    print(f"P27 PASS: three-source snapshot sealed {snapshot.digest()[:16]}…")

if __name__=="__main__": main()
