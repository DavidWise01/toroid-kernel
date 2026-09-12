"""Petals P77: deterministic recall from append-only Posi memory."""
from dataclasses import dataclass

@dataclass(frozen=True)
class MemoryItem:
    sequence:int
    marker:str

@dataclass(frozen=True)
class PosiMemory:
    items:tuple[MemoryItem,...]=()
    def remember(self,marker:str)->"PosiMemory":
        if not marker: raise ValueError("empty memory marker")
        return PosiMemory(self.items+(MemoryItem(len(self.items),marker),))
    def recall(self,sequence:int)->MemoryItem|None:
        return next((item for item in self.items if item.sequence==sequence),None)

def main()->None:
    m=PosiMemory().remember("triad-aligned").remember("observation-ready")
    assert m.recall(0)==MemoryItem(0,"triad-aligned")
    assert m.recall(1)==MemoryItem(1,"observation-ready")
    assert m.recall(2) is None and m.recall(-1) is None
    print("P77 PASS: Posi recalls ordered memory without changing it")

if __name__=="__main__": main()
