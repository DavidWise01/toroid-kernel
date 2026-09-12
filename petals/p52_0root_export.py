"""Petals P52: create a local read-only observation export for 0root.ai."""
from dataclasses import dataclass, asdict
import hashlib, json

@dataclass(frozen=True)
class ObservationExport:
    target:str; runtime:str; state:str; triad:str; scope:str; authority:str
    def payload(self)->str: return json.dumps(asdict(self),sort_keys=True)
    def digest(self)->str: return hashlib.sha256(self.payload().encode()).hexdigest()

def main()->None:
    e=ObservationExport("0root.ai","posi","ready","aligned","loopback","laptop:0root")
    d=json.loads(e.payload())
    assert d["target"]=="0root.ai" and d["scope"]=="loopback" and d["authority"]=="laptop:0root"
    assert len(e.digest())==64
    assert "command" not in d and "write" not in d
    print(f"P52 PASS: read-only 0root.ai export prepared {e.digest()[:16]}…")

if __name__=="__main__": main()
