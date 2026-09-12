"""Petals P32: read-only Posi observation frame for hallway overlay."""
from dataclasses import asdict, dataclass
import json

@dataclass(frozen=True)
class HallwayFrame:
    runtime: str
    state: str
    source_count: int
    observation_digest: str
    scope: str="read-only-display"
    def payload(self)->str:
        return json.dumps(asdict(self),sort_keys=True)

def main()->None:
    frame=HallwayFrame("posi","observation_ready",3,
        "69409c1106c77436"+"0"*48)
    data=json.loads(frame.payload())
    assert data["runtime"]=="posi" and data["state"]=="observation_ready"
    assert data["source_count"]==3 and data["scope"]=="read-only-display"
    assert "command" not in data
    print("P32 PASS: Posi observation serialized as read-only hallway frame")

if __name__=="__main__": main()
