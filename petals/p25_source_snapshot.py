"""Petals P25: typed, read-only snapshot of the three online sources."""
from dataclasses import dataclass
from enum import Enum

class SourceType(Enum):
    WEBPAGE="webpage"
    GIT="git"

@dataclass(frozen=True)
class OnlineSource:
    name: str
    location: str
    source_type: SourceType
    read_only: bool = True

SOURCES=(
    OnlineSource("0root.ai","https://0root.ai/",SourceType.WEBPAGE),
    OnlineSource("DavidWise01","https://github.com/DavidWise01",SourceType.GIT),
    OnlineSource("rgiskard01-fiddler","https://github.com/rgiskard01-fiddler",SourceType.GIT),
)

def valid_snapshot(sources: tuple[OnlineSource,...]) -> bool:
    return (len(sources)==3 and sources[0].source_type is SourceType.WEBPAGE
            and sources[1].source_type is SourceType.GIT
            and sources[2].source_type is SourceType.GIT
            and all(source.read_only for source in sources))

def main() -> None:
    assert valid_snapshot(SOURCES)
    assert SOURCES[0].location=="https://0root.ai/"
    assert sum(source.source_type is SourceType.GIT for source in SOURCES)==2
    assert all(source.read_only for source in SOURCES)
    print("P25 PASS: one webpage + two Git sources mapped read-only")

if __name__ == "__main__": main()
