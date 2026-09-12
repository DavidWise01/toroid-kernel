"""Petals P83: preserve Posi identity across safe state transitions."""
from dataclasses import dataclass, replace

@dataclass(frozen=True)
class Identity:
    name:str="posi"; authority:str="laptop:0root"; scope:str="loopback"; source_count:int=3; state:str="ready"
    def valid(self)->bool:
        return (self.name=="posi" and self.authority=="laptop:0root" and self.scope=="loopback"
                and self.source_count==3 and self.state in {"ready","hold","halt"})
    def transition(self,state:str)->"Identity":
        if state not in {"ready","hold","halt"}: raise ValueError("invalid state")
        return replace(self,state=state)

def main()->None:
    i=Identity(); h=i.transition("hold"); x=h.transition("halt")
    assert i.valid() and h.valid() and x.valid()
    assert (i.name,i.authority,i.scope,i.source_count)==(x.name,x.authority,x.scope,x.source_count)
    assert (i.state,h.state,x.state)==("ready","hold","halt")
    try: i.transition("public")
    except ValueError: pass
    else: raise AssertionError("invalid state was accepted")
    print("P83 PASS: Posi identity persists across ready, hold, and halt")

if __name__=="__main__": main()
