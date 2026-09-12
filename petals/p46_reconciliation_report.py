"""Petals P46: read-only reconciliation report for the three-source torus."""
from dataclasses import dataclass
from enum import Enum

class Result(Enum):
    ALIGNED="aligned"; DRIFT="drift"; MISSING="missing"

@dataclass(frozen=True)
class Reconciliation:
    sources: tuple[str,...]
    revisions: tuple[str,...]
    def result(self)->Result:
        if len(self.sources)!=3 or len(self.revisions)!=3 or not all(self.revisions): return Result.MISSING
        return Result.ALIGNED if len(set(self.revisions))==1 else Result.DRIFT
    def next_action(self)->str:
        return "observe" if self.result() is Result.ALIGNED else "halt-and-review"

def main()->None:
    a=Reconciliation(("0root.ai","DavidWise01","rgiskard01-fiddler"),("r1","r1","r1"))
    d=Reconciliation(a.sources,("r1","r2","r1")); m=Reconciliation(a.sources[:2],("r1","r1"))
    assert a.result() is Result.ALIGNED and a.next_action()=="observe"
    assert d.result() is Result.DRIFT and d.next_action()=="halt-and-review"
    assert m.result() is Result.MISSING and m.next_action()=="halt-and-review"
    print("P46 PASS: reconciliation reports aligned, drift, and missing states")

if __name__=="__main__": main()
