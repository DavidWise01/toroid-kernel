"""Petals P45: tamper-evident hash chain for the audit ledger."""
from dataclasses import dataclass
import hashlib

@dataclass(frozen=True)
class ChainEntry:
    index:int; description:str; previous:str; digest:str

@dataclass(frozen=True)
class HashChain:
    entries: tuple[ChainEntry,...]=()
    def append(self,description:str)->"HashChain":
        previous=self.entries[-1].digest if self.entries else "ROOT"
        index=len(self.entries)
        digest=hashlib.sha256(f"{index}|{description}|{previous}".encode()).hexdigest()
        return HashChain(self.entries+(ChainEntry(index,description,previous,digest),))
    def valid(self)->bool:
        rebuilt=HashChain()
        for entry in self.entries:
            expected=rebuilt.append(entry.description).entries[-1]
            if entry!=expected: return False
            rebuilt=rebuilt.append(entry.description)
        return True

def main()->None:
    chain=HashChain().append("P43 triad dry-run").append("P44 ledger seal")
    assert chain.valid()
    assert chain.entries[1].previous==chain.entries[0].digest
    tampered=HashChain((chain.entries[0],ChainEntry(1,"altered",chain.entries[0].digest,chain.entries[1].digest)))
    assert not tampered.valid()
    print("P45 PASS: audit hash chain detects tampering and preserves append order")

if __name__=="__main__": main()
