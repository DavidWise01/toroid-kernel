"""Petals P50: read-only online checkpoint for private Posi channel."""
from dataclasses import dataclass, asdict
import json

@dataclass(frozen=True)
class OnlineCheckpoint:
    runtime:str; runtime_state:str; triad_result:str; hallway_display:str; control:str; scope:str
    def online(self)->bool:
        return (self.runtime=="posi" and self.runtime_state=="ready"
                and self.triad_result=="aligned"
                and self.hallway_display=="OBSERVATION_ALLOWED"
                and self.control=="none" and self.scope=="loopback")
    def payload(self)->str: return json.dumps(asdict(self),sort_keys=True)

def main()->None:
    c=OnlineCheckpoint("posi","ready","aligned","OBSERVATION_ALLOWED","none","loopback")
    assert c.online() and json.loads(c.payload())["scope"]=="loopback"
    h=OnlineCheckpoint("posi","ready","drift","HALTED","none","loopback")
    assert not h.online()
    print("P50 PASS: private Posi online checkpoint verified; control path absent")

if __name__=="__main__": main()
