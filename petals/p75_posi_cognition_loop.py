"""Petals P75: first deterministic, read-only Posi cognition loop."""
from dataclasses import dataclass
from enum import Enum

class State(Enum):
    READY="ready"; OBSERVED="observed"; HOLD="hold"

@dataclass(frozen=True)
class Observation:
    source_count:int
    triad:str
    scope:str

@dataclass
class PosiBrain:
    state:State=State.READY
    def think(self,observation:Observation)->str:
        if observation.source_count!=3 or observation.triad!="aligned":
            self.state=State.HOLD; return "hold: context-not-aligned"
        if observation.scope!="loopback":
            self.state=State.HOLD; return "hold: scope-not-private"
        self.state=State.OBSERVED; self.state=State.HOLD
        return "hold: observation-complete"

def main()->None:
    b=PosiBrain()
    assert b.think(Observation(3,"aligned","loopback"))=="hold: observation-complete"
    assert b.state is State.HOLD
    bad=PosiBrain()
    assert bad.think(Observation(2,"aligned","loopback"))=="hold: context-not-aligned"
    public=PosiBrain()
    assert public.think(Observation(3,"aligned","public"))=="hold: scope-not-private"
    print("P75 PASS: Posi cognition observes verified context and chooses bounded hold")

if __name__=="__main__": main()
