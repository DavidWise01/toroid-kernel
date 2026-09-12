"""Petals P47: lock Posi progression to aligned three-source state."""
from dataclasses import dataclass
from enum import Enum

class Result(Enum):
    ALIGNED="aligned"; DRIFT="drift"; MISSING="missing"
class CoreState(Enum):
    WAITING="waiting"; OBSERVATION_ALLOWED="observation_allowed"; HALTED="halted"

@dataclass
class ReconciliationLock:
    state: CoreState=CoreState.WAITING
    def advance(self,result: Result)->CoreState:
        self.state=CoreState.OBSERVATION_ALLOWED if result is Result.ALIGNED else CoreState.HALTED
        return self.state

def main()->None:
    assert ReconciliationLock().advance(Result.ALIGNED) is CoreState.OBSERVATION_ALLOWED
    assert ReconciliationLock().advance(Result.DRIFT) is CoreState.HALTED
    assert ReconciliationLock().advance(Result.MISSING) is CoreState.HALTED
    print("P47 PASS: only aligned triad reaches observation; drift hard-stops")

if __name__=="__main__": main()
