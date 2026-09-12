"""Petals P36: read-only drift detection across three online sources."""
from dataclasses import dataclass

@dataclass(frozen=True)
class Revision:
    source: str
    value: str

@dataclass(frozen=True)
class DriftReport:
    revisions: tuple[Revision,...]
    def changed(self, other:"DriftReport")->tuple[str,...]:
        old={item.source:item.value for item in self.revisions}
        return tuple(item.source for item in other.revisions if old.get(item.source)!=item.value)

def main()->None:
    before=DriftReport((Revision("0root.ai","a"),Revision("DavidWise01","b"),Revision("rgiskard01-fiddler","c")))
    after=DriftReport((Revision("0root.ai","a"),Revision("DavidWise01","b2"),Revision("rgiskard01-fiddler","c")))
    assert before.changed(before)==()
    assert before.changed(after)==("DavidWise01",)
    print("P36 PASS: source drift detected read-only; no merge or overwrite")

if __name__=="__main__": main()
