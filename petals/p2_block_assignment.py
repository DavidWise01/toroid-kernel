"""Petals P2: assign model blocks to admitted GPU nodes."""

from dataclasses import dataclass


@dataclass(frozen=True)
class GpuNode:
    node_id: str
    gpu_memory_gib: int
    healthy: bool = True


def assign_block(node: GpuNode, block: str, minimum_memory_gib: int = 1) -> str | None:
    """Return a routing record only when the node can safely serve the block."""
    if node.healthy and node.gpu_memory_gib >= minimum_memory_gib and block:
        return f"{block}@{node.node_id}"
    return None


def main() -> None:
    ready = GpuNode("node-01", 8)
    weak = GpuNode("node-02", 0)
    offline = GpuNode("node-03", 8, False)
    assert assign_block(ready, "block-0") == "block-0@node-01"
    assert assign_block(weak, "block-1") is None
    assert assign_block(offline, "block-2") is None
    print("Petals P2 block assignment: PASS")


if __name__ == "__main__":
    main()
