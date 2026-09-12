"""Petals P78: deterministic comparison of new input with Posi memory."""
from dataclasses import dataclass
from enum import Enum

class Match(Enum):
    KNOWN="known"; NEW="new"; CONFLICT="conflict"

@dataclass(frozen=True)
class Memory:
    markers:tuple[str,...]=()
    def add(self,marker:str)->"Memory":
        if not marker: raise ValueError("empty marker")
        return Memory(self.markers+(marker,))
    def compare(self,marker:str,expected:str)->Match:
        if marker in self.markers and marker==expected: return Match.KNOWN
        if marker not in self.markers and marker==expected: return Match.NEW
        return Match.CONFLICT

def main()->None:
    m=Memory().add("triad-aligned")
    assert m.compare("triad-aligned","triad-aligned") is Match.KNOWN
    assert m.compare("observation-ready","observation-ready") is Match.NEW
    assert m.compare("drift","aligned") is Match.CONFLICT
    print("P78 PASS: Posi distinguishes known, new, and conflicting input")

if __name__=="__main__": main()
