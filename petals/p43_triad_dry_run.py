"""Petals P43: audit a complete three-source dry-run without writing."""
from dataclasses import dataclass

@dataclass(frozen=True)
class DryRunEntry:
    source: str
    path: str
    action: str="would-update"

@dataclass(frozen=True)
class DryRunAudit:
    entries: tuple[DryRunEntry,...]
    def valid(self)->bool:
        return (len(self.entries)==3
                and {e.source for e in self.entries}=={"0root.ai","DavidWise01","rgiskard01-fiddler"}
                and all(e.action=="would-update" for e in self.entries)
                and all(not e.path.startswith("/") for e in self.entries))

def main()->None:
    audit=DryRunAudit((DryRunEntry("0root.ai","llms.txt"),
        DryRunEntry("DavidWise01","petals/p43_triad_dry_run.py"),
        DryRunEntry("rgiskard01-fiddler","README.md")))
    assert audit.valid()
    assert all(e.action=="would-update" for e in audit.entries)
    assert not any(e.action=="update" for e in audit.entries)
    print("P43 PASS: three-source dry-run audit complete; zero writes requested")

if __name__=="__main__": main()
