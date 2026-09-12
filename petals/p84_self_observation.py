"""Petals P84: read-only self-observation for the Posi core."""
from dataclasses import dataclass,asdict
import json

@dataclass(frozen=True)
class SelfSnapshot:
    name:str; state:str; last_decision:str; scope:str
    def valid(self)->bool:
        return (self.name=="posi" and self.state in {"ready","hold","halt"}
                and bool(self.last_decision) and self.scope=="loopback")
    def payload(self)->str: return json.dumps(asdict(self),sort_keys=True)

def main()->None:
    s=SelfSnapshot("posi","hold","observation-complete","loopback")
    assert s.valid()
    d=json.loads(s.payload())
    assert d["name"]=="posi" and d["state"]=="hold" and d["scope"]=="loopback"
    assert "mutate" not in d
    assert not SelfSnapshot("posi","ready","","loopback").valid()
    print("P84 PASS: Posi reports its own bounded state without self-modification")

if __name__=="__main__": main()
