"""Petals P57: one-file-at-a-time publication handoff manifest."""
from dataclasses import dataclass
import hashlib

@dataclass(frozen=True)
class Handoff:
    target:str
    files:tuple[str,...]
    payload_digest:str
    live_write:bool=False
    def valid(self)->bool:
        return (self.target=="0root.ai" and self.files==("/llms.txt","/robots.txt")
                and len(self.payload_digest)==64 and not self.live_write)

def digest(llms:str,robots:str)->str:
    return hashlib.sha256((llms+"\n---\n"+robots).encode()).hexdigest()

def main()->None:
    d=digest("llms-payload","robots-payload")
    h=Handoff("0root.ai",("/llms.txt","/robots.txt"),d)
    assert h.valid() and not h.live_write and digest("llms-payload","robots-payload")==d
    assert not Handoff(h.target,h.files,d,True).valid()
    print("P57 PASS: 0root.ai two-file handoff sealed; live write remains OFF")

if __name__=="__main__": main()
