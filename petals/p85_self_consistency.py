"""Petals P85: verify Posi self-observation against declared identity."""
from dataclasses import dataclass

@dataclass(frozen=True)
class Identity:
    name:str="posi"; scope:str="loopback"

@dataclass(frozen=True)
class SelfSnapshot:
    name:str; scope:str; state:str

def consistent(identity:Identity,snapshot:SelfSnapshot)->bool:
    return (snapshot.name==identity.name and snapshot.scope==identity.scope
            and snapshot.state in {"ready","hold","halt"})

def next_state(identity:Identity,snapshot:SelfSnapshot)->str:
    return snapshot.state if consistent(identity,snapshot) else "halt"

def main()->None:
    i=Identity(); g=SelfSnapshot("posi","loopback","hold")
    n=SelfSnapshot("other","loopback","hold"); s=SelfSnapshot("posi","public","hold")
    assert consistent(i,g) and next_state(i,g)=="hold"
    assert not consistent(i,n) and not consistent(i,s)
    assert next_state(i,n)=="halt" and next_state(i,s)=="halt"
    print("P85 PASS: Posi self-model mismatch safely resolves to halt")

if __name__=="__main__": main()
