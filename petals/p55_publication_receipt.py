"""Petals P55: auditable receipt for an approved documentation export."""
from dataclasses import dataclass
import hashlib

@dataclass(frozen=True)
class PublicationReceipt:
    target:str
    export_digest:str
    approver:str
    action:str="not-yet-published"
    def valid(self)->bool:
        return (self.target=="0root.ai" and len(self.export_digest)==64
                and bool(self.approver) and self.action=="not-yet-published")
    def digest(self)->str:
        return hashlib.sha256(f"{self.target}|{self.export_digest}|{self.approver}|{self.action}".encode()).hexdigest()

def main()->None:
    r=PublicationReceipt("0root.ai","63480d7fdd6dbc4d"+"0"*48,"facilitator")
    assert r.valid() and len(r.digest())==64 and r.digest()==r.digest()
    assert not PublicationReceipt(r.target,r.export_digest,"").valid()
    print(f"P55 PASS: publication receipt sealed {r.digest()[:16]}…")

if __name__=="__main__": main()
