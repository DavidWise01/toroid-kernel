"""Petals P80: transparent deterministic Posi thought trace."""
from dataclasses import dataclass

@dataclass(frozen=True)
class ThoughtTrace:
    steps:tuple[str,...]
    def valid(self)->bool:
        return self.steps==("observe","compare","decide","learn")

def think(verified:bool,compatible:bool,new:bool)->ThoughtTrace:
    if not verified: return ThoughtTrace(("observe","halt-unverified"))
    if not compatible: return ThoughtTrace(("observe","compare","decide-reject"))
    return ThoughtTrace(("observe","compare","decide","learn" if new else "known"))

def main()->None:
    assert think(True,True,True).valid()
    assert think(False,True,True).steps==("observe","halt-unverified")
    assert think(True,False,True).steps[-1]=="decide-reject"
    assert think(True,True,False).steps[-1]=="known"
    print("P80 PASS: Posi thought trace is ordered, transparent, and deterministic")

if __name__=="__main__": main()
