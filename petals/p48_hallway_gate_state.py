"""Petals P48: expose reconciliation-lock state to the read-only hallway."""
from dataclasses import dataclass, asdict
from enum import Enum
import json

class Result(Enum):
    ALIGNED="aligned"; DRIFT="drift"; MISSING="missing"

@dataclass(frozen=True)
class HallwayState:
    result:str
    display:str
    control:str="none"
    def payload(self)->str: return json.dumps(asdict(self),sort_keys=True)

def display_for(result:Result)->HallwayState:
    return HallwayState(result.value,"OBSERVATION_ALLOWED" if result is Result.ALIGNED else "HALTED")

def main()->None:
    a=display_for(Result.ALIGNED); d=display_for(Result.DRIFT); m=display_for(Result.MISSING)
    assert json.loads(a.payload())["display"]=="OBSERVATION_ALLOWED"
    assert json.loads(d.payload())["display"]=="HALTED"
    assert json.loads(m.payload())["display"]=="HALTED"
    assert a.control==d.control==m.control=="none"
    print("P48 PASS: hallway reflects aligned or halted state with no control path")

if __name__=="__main__": main()
