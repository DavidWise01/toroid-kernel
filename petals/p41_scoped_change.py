"""Petals P41: require an exact source and path for future changes."""
from dataclasses import dataclass

ALLOWED_SOURCES={"0root.ai","DavidWise01","rgiskard01-fiddler"}

@dataclass(frozen=True)
class ScopedChange:
    source: str
    path: str
    proposal_digest: str
    approved: bool
    def valid(self)->bool:
        return (self.source in ALLOWED_SOURCES and bool(self.path)
                and not self.path.startswith("/")
                and len(self.proposal_digest)==64 and self.approved)

def main()->None:
    c=ScopedChange("0root.ai","llms.txt","a"*64,True)
    assert c.valid()
    assert not ScopedChange("0root.ai","llms.txt","a"*64,False).valid()
    assert not ScopedChange("DavidWise01","/outside","a"*64,True).valid()
    assert not ScopedChange("all-sources","llms.txt","a"*64,True).valid()
    print("P41 PASS: approved changes require one exact source and relative path")

if __name__=="__main__": main()
