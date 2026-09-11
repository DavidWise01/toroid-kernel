"""Petals P6: explicit peer-policy gate.

This policy is intentionally conservative: it does not discover peers or start
GPU work. A peer must be explicitly approved before a future transport layer
may use it.
"""

from dataclasses import dataclass
from typing import FrozenSet


@dataclass(frozen=True)
class PeerPolicy:
    allow_public_discovery: bool = False
    approved_peers: FrozenSet[str] = frozenset()

    def permits(self, peer: str, discovered: bool = False) -> bool:
        if discovered and not self.allow_public_discovery:
            return False
        return peer in self.approved_peers


def main() -> None:
    policy = PeerPolicy(approved_peers=frozenset({"peer.home"}))
    assert policy.permits("peer.home")
    assert not policy.permits("peer.unknown")
    assert not policy.permits("peer.home", discovered=True)

    open_policy = PeerPolicy(
        allow_public_discovery=True,
        approved_peers=frozenset({"peer.public"}),
    )
    assert open_policy.permits("peer.public", discovered=True)
    print("P6 PASS: explicit peer allowlist enforced; public discovery denied")


if __name__ == "__main__":
    main()
