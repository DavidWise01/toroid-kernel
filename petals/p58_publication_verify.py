"""Petals P58: verify two published text responses against expected payload."""
from dataclasses import dataclass
import hashlib

@dataclass(frozen=True)
class Verification:
    target:str
    expected_digest:str
    actual_digest:str
    def result(self)->str:
        return "MATCH" if self.target=="0root.ai" and self.expected_digest==self.actual_digest else "MISMATCH"

def payload_digest(llms:str,robots:str)->str:
    return hashlib.sha256((llms+"\n---\n"+robots).encode()).hexdigest()

def main()->None:
    llms="# 0root.ai\nprivate Posi core"; robots="User-agent: *\nAllow: /\n"
    d=payload_digest(llms,robots)
    assert Verification("0root.ai",d,d).result()=="MATCH"
    assert Verification("0root.ai",d,"0"*64).result()=="MISMATCH"
    assert Verification("other.example",d,d).result()=="MISMATCH"
    print("P58 PASS: publication verifier distinguishes exact match from mismatch")

if __name__=="__main__": main()
