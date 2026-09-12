"""Petals P54: explicit gate before any 0root.ai publication."""
from dataclasses import dataclass

@dataclass(frozen=True)
class PublicationDecision:
    export_digest:str
    local_valid:bool
    approved:bool
    def publishable(self)->bool:
        return len(self.export_digest)==64 and self.local_valid and self.approved

def main()->None:
    d=PublicationDecision("63480d7fdd6dbc4d"+"0"*48,True,True)
    assert d.publishable()
    assert not PublicationDecision(d.export_digest,False,True).publishable()
    assert not PublicationDecision(d.export_digest,True,False).publishable()
    print("P54 PASS: publication requires valid export and explicit approval")

if __name__=="__main__": main()
