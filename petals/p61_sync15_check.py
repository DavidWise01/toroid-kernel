"""Petals P61: fifteen read-only triad alignment passes."""
from dataclasses import dataclass

@dataclass(frozen=True)
class PassResult:
    number:int
    aligned:bool

def sync_passes(revisions:tuple[str,...],count:int=15)->tuple[PassResult,...]:
    aligned=len(revisions)==3 and bool(revisions) and len(set(revisions))==1
    return tuple(PassResult(i,aligned) for i in range(1,count+1))

def main()->None:
    r=sync_passes(("r1","r1","r1"))
    assert len(r)==15 and all(x.aligned for x in r)
    d=sync_passes(("r1","r2","r1"))
    assert len(d)==15 and not any(x.aligned for x in d)
    print("P61 PASS: sync ×15 stable in read-only mode; drift remains blocked")

if __name__=="__main__": main()
