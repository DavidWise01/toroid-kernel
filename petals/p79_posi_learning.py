"""Petals P79: append-only learning for new, non-conflicting input."""
from dataclasses import dataclass
from enum import Enum

class Outcome(Enum):
    KNOWN="known"; LEARNED="learned"; REJECTED="rejected"

@dataclass(frozen=True)
class Learner:
    memory:tuple[str,...]=()
    def learn(self,marker:str,expected:str)->tuple["Learner",Outcome]:
        if marker!=expected: return self,Outcome.REJECTED
        if marker in self.memory: return self,Outcome.KNOWN
        return Learner(self.memory+(marker,)),Outcome.LEARNED

def main()->None:
    l=Learner(("triad-aligned",))
    same,k=l.learn("triad-aligned","triad-aligned")
    assert same==l and k is Outcome.KNOWN
    expanded,learned=l.learn("observation-ready","observation-ready")
    assert expanded.memory==("triad-aligned","observation-ready") and learned is Outcome.LEARNED
    unchanged,rejected=l.learn("drift","aligned")
    assert unchanged==l and rejected is Outcome.REJECTED
    print("P79 PASS: only new compatible input is appended to Posi learning memory")

if __name__=="__main__": main()
