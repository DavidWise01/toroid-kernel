"""Petals P3: backend-neutral block records.

Geometry is represented independently from the compute backend. CPU and GPU
are execution choices for model blocks, not requirements of the geometry.
"""

from dataclasses import dataclass
from enum import Enum


class Backend(Enum):
    CPU = "cpu"
    GPU = "gpu"


@dataclass(frozen=True)
class GeometryBlock:
    name: str
    dimensions: int


@dataclass(frozen=True)
class BlockRoute:
    block: GeometryBlock
    backend: Backend


def route(block: GeometryBlock, backend: Backend) -> BlockRoute:
    if block.dimensions <= 0:
        raise ValueError("dimensions must be positive")
    return BlockRoute(block, backend)


def main() -> None:
    cubi = GeometryBlock("analytical-cubi", 3)
    cpu_route = route(cubi, Backend.CPU)
    gpu_route = route(cubi, Backend.GPU)
    assert cpu_route.block == gpu_route.block
    assert cpu_route.backend is Backend.CPU
    assert gpu_route.backend is Backend.GPU
    print("Petals P3 backend-neutral blocks: PASS")


if __name__ == "__main__":
    main()
