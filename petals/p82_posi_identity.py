"""Petals P82: bounded operational identity for the Posi core."""
from dataclasses import dataclass

@dataclass(frozen=True)
class PosiIdentity:
    name:str; authority:str; scope:str; source_count:int; state:str
    def valid(self)->bool:
        return (self.name=="posi" and self.authority=="laptop:0root"
                and self.scope=="loopback" and self.source_count==3
                and self.state in {"ready","hold","halt"})

def main()->None:
    i=PosiIdentity("posi","laptop:0root","loopback",3,"ready")
    assert i.valid() and i.name=="posi" and i.scope=="loopback"
    assert not PosiIdentity("posi","public:root","loopback",3,"ready").valid()
    assert not PosiIdentity("posi","laptop:0root","loopback",2,"ready").valid()
    print("P82 PASS: Posi operational identity is bounded to local root and triad")

if __name__=="__main__": main()
