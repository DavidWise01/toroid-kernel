"""Petals P40: explicit human approval record for a sync proposal."""
from dataclasses import dataclass

@dataclass(frozen=True)
class Approval:
    proposal_digest: str
    approver: str
    approved: bool
    def valid(self)->bool:
        return len(self.proposal_digest)==64 and bool(self.approver)

def can_request_write(approval: Approval)->bool:
    return approval.valid() and approval.approved

def main()->None:
    a=Approval("88162a7abb7a3204cfd0034758dab40cab7273a4"+"0"*24,"facilitator",True)
    assert a.valid() and can_request_write(a)
    d=Approval(a.proposal_digest,a.approver,False)
    assert d.valid() and not can_request_write(d)
    print("P40 PASS: explicit approval recorded; declined proposals remain blocked")

if __name__=="__main__": main()
