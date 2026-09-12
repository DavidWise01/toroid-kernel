"""Petals P87: symbolic monoline gravity language."""
from dataclasses import dataclass
from enum import Enum

class Force(Enum):
    PULL=-1; NEUTRAL=0; PUSH=1

@dataclass(frozen=True)
class GravityLine:
    markers:tuple[str,...]
    observer:str
    force:Force
    def valid(self)->bool:
        return len(self.markers)==4 and all(m=="U" for m in self.markers) and bool(self.observer)
    def gaps(self)->int: return max(0,len(self.markers)-1)
    def language(self)->tuple[str,...]: return ("U","gap","U","gap","U","gap","U")

def main()->None:
    line=GravityLine(("U","U","U","U"),"outside-observer",Force.NEUTRAL)
    assert line.valid() and line.gaps()==3
    assert line.language()==("U","gap","U","gap","U","gap","U")
    assert Force.PULL.value==-1 and Force.PUSH.value==1
    assert not GravityLine(("U","X","U","U"),"outside-observer",Force.PULL).valid()
    print("P87 PASS: UUUU monoline has three gaps and signed outside-observer field")

if __name__=="__main__": main()
