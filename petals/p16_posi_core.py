"""Petals P16: deterministic inner Posi core for the private vacuum."""
from dataclasses import dataclass
from enum import Enum

class State(Enum):
    BOOT = "boot"
    READY = "ready"
    HALT = "halt"

@dataclass
class PosiCore:
    state: State = State.BOOT
    ticks: int = 0

    def step(self) -> State:
        if self.state is State.BOOT:
            self.state = State.READY
        elif self.state is State.READY:
            self.ticks += 1
        else:
            self.state = State.HALT
        return self.state

    def stop(self) -> State:
        self.state = State.HALT
        return self.state

def main() -> None:
    core = PosiCore()
    assert core.state is State.BOOT
    assert core.step() is State.READY
    assert core.step() is State.READY
    assert core.ticks == 1
    assert core.stop() is State.HALT
    assert core.step() is State.HALT
    print("P16 PASS: deterministic Posi core transitions BOOT → READY → HALT")

if __name__ == "__main__":
    main()
