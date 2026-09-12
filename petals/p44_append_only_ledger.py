"""Petals P44: append-only audit ledger for dry-run proposals."""
from dataclasses import dataclass

@dataclass(frozen=True)
class LedgerEntry:
    index: int
    description: str

@dataclass(frozen=True)
class Ledger:
    entries: tuple[LedgerEntry,...]=()
    def append(self,description: str)->"Ledger":
        if not description: raise ValueError("empty ledger entry")
        return Ledger(self.entries+(LedgerEntry(len(self.entries),description),))
    def valid(self)->bool:
        return all(e.index==i and bool(e.description) for i,e in enumerate(self.entries))

def main()->None:
    ledger=Ledger().append("P43 triad dry-run")
    ledger2=ledger.append("P44 ledger seal")
    assert ledger.valid() and ledger2.valid()
    assert len(ledger2.entries)==2 and ledger2.entries[0]==ledger.entries[0]
    assert ledger2.entries[1].index==1
    print("P44 PASS: audit ledger appends by index; prior records remain unchanged")

if __name__=="__main__": main()
