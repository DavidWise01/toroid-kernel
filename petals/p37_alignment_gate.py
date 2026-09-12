"""Petals P37: read-only three-source alignment gate."""
from dataclasses import dataclass
from enum import Enum

class Alignment(Enum):
    ALIGNED="aligned"
    DRIFT="drift"

@dataclass(frozen=True)
class SourceRevision:
    source: str
    revision: str

def alignment(revisions: tuple[SourceRevision,...])->Alignment:
    if len(revisions)!=3 or not all(item.revision for item in revisions):
        return Alignment.DRIFT
    return Alignment.ALIGNED if len({item.revision for item in revisions})==1 else Alignment.DRIFT

def main()->None:
    same=(SourceRevision("0root.ai","r1"),SourceRevision("DavidWise01","r1"),SourceRevision("rgiskard01-fiddler","r1"))
    split=same[:2]+(SourceRevision("rgiskard01-fiddler","r2"),)
    assert alignment(same) is Alignment.ALIGNED
    assert alignment(split) is Alignment.DRIFT
    assert alignment(same[:2]) is Alignment.DRIFT
    print("P37 PASS: triad alignment detected; drift halts synchronization")

if __name__=="__main__": main()
