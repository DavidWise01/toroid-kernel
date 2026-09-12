"""Petals P64: machine-check the 2-sentinel + 1-analytical structure."""
from dataclasses import dataclass
from enum import Enum

class Role(Enum):
    SENTINEL="sentinel"
    ANALYTICAL="analytical"

@dataclass(frozen=True)
class Cubit:
    position:str
    role:Role

SPINE=(Cubit("L",Role.SENTINEL),Cubit("1",Role.ANALYTICAL),Cubit("R",Role.SENTINEL))

def valid_spine(spine:tuple[Cubit,...])->bool:
    return (len(spine)==3 and spine[0].role is Role.SENTINEL
            and spine[1].role is Role.ANALYTICAL and spine[2].role is Role.SENTINEL
            and tuple(c.position for c in spine)==("L","1","R"))

def main()->None:
    assert valid_spine(SPINE)
    assert sum(c.role is Role.SENTINEL for c in SPINE)==2
    assert sum(c.role is Role.ANALYTICAL for c in SPINE)==1
    assert not valid_spine((Cubit("L",Role.ANALYTICAL),SPINE[1],SPINE[2]))
    print("P64 PASS: two sentinels flank one analytical cubit")

if __name__=="__main__": main()
