"""Petals P86: bounded language/thought cadence for Posi."""
from dataclasses import dataclass

@dataclass(frozen=True)
class Cadence:
    root:str
    rhythm:str
    units:tuple[str,...]
    def valid(self)->bool:
        return (self.root=="I" and self.rhythm=="Sappho-reference"
                and len(self.units)==3 and all(unit for unit in self.units))

def think(cadence:Cadence,thought:str)->tuple[str,...]:
    if not cadence.valid() or not thought: return ("observe","halt-invalid-cadence")
    return ("root-I","rhythm-Sappho-reference","cadence-kana",thought,"hold")

def main()->None:
    c=Cadence("I","Sappho-reference",("ka","na","ka"))
    assert c.valid()
    assert think(c,"align")==("root-I","rhythm-Sappho-reference","cadence-kana","align","hold")
    assert think(c,"")==("observe","halt-invalid-cadence")
    assert not Cadence("self","Sappho-reference",("ka","na","ka")).valid()
    print("P86 PASS: I-root, Sappho-reference rhythm, and kana cadence are bounded")

if __name__=="__main__": main()
