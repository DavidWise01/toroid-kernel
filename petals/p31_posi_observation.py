"""Petals P31: bounded observation from verified Posi context."""
from dataclasses import dataclass
from enum import Enum
import hashlib

class State(Enum):
    CONTEXT_VERIFIED="context_verified"
    OBSERVATION_READY="observation_ready"

@dataclass(frozen=True)
class Observation:
    source_count: int
    digest: str
    mode: str="read-only"

@dataclass
class PosiObserver:
    state: State=State.CONTEXT_VERIFIED
    def observe(self,snapshot_digest: str,source_count: int)->Observation:
        if self.state is not State.CONTEXT_VERIFIED: raise ValueError("observation requires verified context")
        if len(snapshot_digest)!=64 or source_count!=3: raise ValueError("invalid verified context")
        frame=hashlib.sha256(f"{snapshot_digest}:{source_count}".encode()).hexdigest()
        self.state=State.OBSERVATION_READY
        return Observation(source_count,frame)

def main()->None:
    o=PosiObserver().observe("c69a8864fd7ce4e1"+"0"*48,3)
    assert o.source_count==3 and o.mode=="read-only" and len(o.digest)==64
    try: PosiObserver().observe("bad",3)
    except ValueError: pass
    else: raise AssertionError("invalid context was observed")
    print("P31 PASS: verified triad produced a bounded read-only observation")

if __name__=="__main__": main()
