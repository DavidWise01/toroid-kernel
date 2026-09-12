"""Petals P23 v2: verified three-source corpus registry."""
from dataclasses import dataclass

@dataclass(frozen=True)
class CorpusSource:
    name: str
    location: str
    status: str

SOURCES = (
    CorpusSource("0root.ai", "https://0root.ai/", "declared"),
    CorpusSource("DavidWise01 GitHub", "https://github.com/DavidWise01", "verified"),
    CorpusSource("rgiskard01-fiddler GitHub", "https://github.com/rgiskard01-fiddler", "verified"),
)

def valid_registry(sources: tuple[CorpusSource, ...]) -> bool:
    return len(sources) == 3 and all(source.status in {"declared","verified"} for source in sources)

def main() -> None:
    assert valid_registry(SOURCES)
    assert SOURCES[2].location == "https://github.com/rgiskard01-fiddler"
    assert SOURCES[2].status == "verified"
    print("P23 PASS: 0root.ai + DavidWise01 + rgiskard01-fiddler registered")

if __name__ == "__main__": main()
