"""Petals P30: verified-context gate for the private Posi core."""
from dataclasses import dataclass
from enum import Enum

class State(Enum):
    CONTEXT_LOADED="context_loaded"
    CONTEXT_VERIFIED="context_verified"

@dataclass(frozen=True)
class ContextRecord:
    snapshot_digest: str
    provenance_names: tuple[str,...]
    provenance_roles: tuple[str,...]
    def valid(self)->bool:
        return (len(self.snapshot_digest)==64
                and self.provenance_names==("0root.ai","DavidWise01","rgiskard01-fiddler")
                and self.provenance_roles==("webpage","git","git"))

@dataclass
class PosiVerifier:
    state: State=State.CONTEXT_LOADED
    def verify(self, record: ContextRecord)->State:
        if not record.valid(): raise ValueError("context verification failed")
        self.state=State.CONTEXT_VERIFIED
        return self.state

def main()->None:
    record=ContextRecord("c69a8864fd7ce4e1"+"0"*48,
        ("0root.ai","DavidWise01","rgiskard01-fiddler"),("webpage","git","git"))
    verifier=PosiVerifier()
    assert verifier.verify(record) is State.CONTEXT_VERIFIED
    assert verifier.state is State.CONTEXT_VERIFIED
    try: verifier.verify(ContextRecord("bad",record.provenance_names,record.provenance_roles))
    except ValueError: pass
    else: raise AssertionError("invalid context was accepted")
    print("P30 PASS: Posi context verified before processing")

if __name__=="__main__": main()
