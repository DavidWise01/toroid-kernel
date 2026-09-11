"""Petals P1: distributed GPU node admission contract.

This module is a local data contract only. It does not connect to a network or
execute model code.
"""

from dataclasses import dataclass


@dataclass(frozen=True)
class GpuNode:
    node_id: str
    gpu_memory_gib: int
    model_block: str
    healthy: bool


def admit(node: GpuNode) -> bool:
    """Accept only a named, healthy node with positive capacity and a block."""
    return (
        bool(node.node_id)
        and node.gpu_memory_gib > 0
        and bool(node.model_block)
        and node.healthy
    )


def main() -> None:
    ready = GpuNode("node-01", 8, "block-0", True)
    unhealthy = GpuNode("node-02", 8, "block-1", False)
    assert admit(ready)
    assert not admit(unhealthy)
    print("Petals P1 node contract: PASS")


if __name__ == "__main__":
    main()
