"""Petals P13: private single-user Posi test vacuum.

Laptop is ROOT0; Git is corpus; agents are bounded workers; Railway is an
optional observation window. Policy model only: no process, socket, or deploy.
"""
from dataclasses import dataclass

@dataclass(frozen=True)
class VacuumConfig:
    root: str = "laptop:0root"
    corpus: str = "git:corpus"
    agents: tuple[str, ...] = ("agent:posi",)
    window_domains: tuple[str, ...] = ()
    railway_observer_enabled: bool = False
    external_network_enabled: bool = False

    def valid(self) -> bool:
        return (self.root == "laptop:0root" and self.corpus == "git:corpus"
                and bool(self.agents) and not self.external_network_enabled
                and (not self.railway_observer_enabled or bool(self.window_domains)))

    def may_project(self, domain: str) -> bool:
        return (self.valid() and self.railway_observer_enabled
                and domain in self.window_domains)

def main() -> None:
    private = VacuumConfig()
    assert private.valid()
    assert not private.may_project("railway.example")
    windowed = VacuumConfig(window_domains=("railway.example",),
                            railway_observer_enabled=True)
    assert windowed.valid()
    assert windowed.may_project("railway.example")
    assert not windowed.may_project("unknown.example")
    assert not VacuumConfig(external_network_enabled=True).valid()
    print("P13 PASS: private vacuum locked to laptop 0root; projection is opt-in")

if __name__ == "__main__":
    main()
