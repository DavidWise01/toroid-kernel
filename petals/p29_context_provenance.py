"""Petals P29: provenance lock for Posi context."""
from dataclasses import dataclass

@dataclass(frozen=True)
class Provenance:
    names: tuple[str, ...]
    roles: tuple[str, ...]
    snapshot_digest: str
    def valid(self) -> bool:
        return (self.names==("0root.ai","DavidWise01","rgiskard01-fiddler")
                and self.roles==("webpage","git","git")
                and len(self.snapshot_digest)==64)

def main() -> None:
    p=Provenance(("0root.ai","DavidWise01","rgiskard01-fiddler"),
        ("webpage","git","git"),"c69a8864fd7ce4e1"+"0"*48)
    assert p.valid()
    assert p.names[0]=="0root.ai"
    assert p.roles.count("git")==2
    assert not Provenance(p.names,("git","webpage","git"),p.snapshot_digest).valid()
    print("P29 PASS: Posi context provenance locked to webpage + two Git sources")

if __name__=="__main__": main()
