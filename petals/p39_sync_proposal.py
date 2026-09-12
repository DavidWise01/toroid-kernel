"""Petals P39: prepare, but do not apply, a triad sync proposal."""
from dataclasses import dataclass

@dataclass(frozen=True)
class SyncProposal:
    target_revision: str
    source_names: tuple[str,...]
    receipt_digest: str

def prepare(receipt_digest: str,sources: tuple[str,...],target: str)->SyncProposal|None:
    if len(receipt_digest)!=64 or len(sources)!=3 or not target: return None
    return SyncProposal(target,sources,receipt_digest)

def apply(_proposal: SyncProposal)->bool:
    return False

def main()->None:
    p=prepare("e6f31040237615b53c652dcb1833f14ff1e5bfea"+"0"*24,
        ("0root.ai","DavidWise01","rgiskard01-fiddler"),"r2")
    assert p is not None and p.target_revision=="r2"
    assert not apply(p)
    assert prepare("bad",p.source_names,"r2") is None
    print("P39 PASS: sync proposal prepared; write path remains disabled")

if __name__=="__main__": main()
