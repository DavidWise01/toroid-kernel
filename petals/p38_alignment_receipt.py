"""Petals P38: deterministic receipt for an aligned triad."""
from dataclasses import dataclass
import hashlib

@dataclass(frozen=True)
class AlignmentReceipt:
    sources: tuple[str,...]
    revision: str
    digest: str

def issue(sources: tuple[str,...], revisions: tuple[str,...])->AlignmentReceipt|None:
    if len(sources)!=3 or len(set(revisions))!=1 or not revisions[0]: return None
    payload="|".join((*sources,revisions[0]))
    return AlignmentReceipt(sources,revisions[0],hashlib.sha256(payload.encode()).hexdigest())

def main()->None:
    sources=("0root.ai","DavidWise01","rgiskard01-fiddler")
    receipt=issue(sources,("r1","r1","r1"))
    assert receipt is not None and receipt.sources==sources
    assert len(receipt.digest)==64
    assert issue(sources,("r1","r2","r1")) is None
    assert issue(sources[:2],("r1","r1")) is None
    print("P38 PASS: aligned triad receipt issued; drift receives no receipt")

if __name__=="__main__": main()
