"""Petals P53: validate a 0root.ai observation export against local truth."""
from dataclasses import dataclass

@dataclass(frozen=True)
class Export:
    target:str; runtime:str; state:str; triad:str; scope:str; authority:str

def matches_local(e:Export)->bool:
    return (e.target=="0root.ai" and e.runtime=="posi" and e.state=="ready"
            and e.triad=="aligned" and e.scope=="loopback" and e.authority=="laptop:0root")

def main()->None:
    good=Export("0root.ai","posi","ready","aligned","loopback","laptop:0root")
    assert matches_local(good)
    assert not matches_local(Export("evil.example","posi","ready","aligned","loopback","laptop:0root"))
    assert not matches_local(Export("0root.ai","posi","ready","drift","loopback","laptop:0root"))
    assert not matches_local(Export("0root.ai","posi","ready","aligned","public","laptop:0root"))
    print("P53 PASS: 0root.ai export matches local Posi truth before publication")

if __name__=="__main__": main()
