"""Petals P28: load the three-source snapshot into Posi read-only context."""
from dataclasses import dataclass
from enum import Enum

class CoreState(Enum):
    READY="ready"
    CONTEXT_LOADED="context_loaded"

@dataclass(frozen=True)
class TriadContext:
    snapshot_digest: str
    source_count: int
    def valid(self) -> bool:
        return len(self.snapshot_digest)==64 and self.source_count==3

@dataclass
class PosiContextCore:
    state: CoreState = CoreState.READY
    context: TriadContext | None = None
    def load(self, context: TriadContext) -> CoreState:
        if not context.valid(): raise ValueError("invalid triad context")
        self.context=context; self.state=CoreState.CONTEXT_LOADED
        return self.state

def main() -> None:
    context=TriadContext("c69a8864fd7ce4e1"+"0"*48,3)
    core=PosiContextCore()
    assert core.load(context) is CoreState.CONTEXT_LOADED
    assert core.context==context
    try: core.load(TriadContext("bad",2))
    except ValueError: pass
    else: raise AssertionError("invalid context was accepted")
    print("P28 PASS: verified triad snapshot loaded into read-only Posi context")

if __name__=="__main__": main()
