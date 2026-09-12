"""Petals P76: append-only short-term memory for verified Posi observations."""
from dataclasses import dataclass

@dataclass(frozen=True)
class MemoryItem:
    sequence:int; source_count:int; triad:str; scope:str

@dataclass(frozen=True)
class PosiMemory:
    items:tuple[MemoryItem,...]=()
    def remember(self,source_count:int,triad:str,scope:str)->"PosiMemory":
        if source_count!=3 or triad!="aligned" or scope!="loopback":
            raise ValueError("only verified private observations enter memory")
        return PosiMemory(self.items+(MemoryItem(len(self.items),source_count,triad,scope),))
    def valid(self)->bool:
        return all(item.sequence==i for i,item in enumerate(self.items))

def main()->None:
    m=PosiMemory().remember(3,"aligned","loopback")
    m2=m.remember(3,"aligned","loopback")
    assert m.valid() and m2.valid() and len(m2.items)==2
    assert m2.items[0]==m.items[0] and m2.items[1].sequence==1
    try: m.remember(2,"aligned","loopback")
    except ValueError: pass
    else: raise AssertionError("unverified observation entered memory")
    print("P76 PASS: verified private observations append to ordered Posi memory")

if __name__=="__main__": main()
