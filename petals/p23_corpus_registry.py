"""Petals P23: explicit three-source corpus registry."""
from dataclasses import dataclass

@dataclass(frozen=True)
class CorpusSource:
    name: str
    location: str
    status: str

SOURCES = (
    CorpusSource("0root.ai", "https://0root.ai/", "declared"),
    CorpusSource("DavidWise01 GitHub", "https://github.com/DavidWise01", "verified"),
    CorpusSource("Fiddler01 GitHub", "https://github.com/Fiddler01", "unresolved"),
)

def valid_registry(sources: tuple[CorpusSource, ...]) -> bool:
    return (len(sources) == 3 and sources[0].name == "0root.ai"
            and sources[1].status == "verified"
            and sources[2].status == "unresolved")

def main() -> None:
    assert valid_registry(SOURCES)
    assert SOURCES[0].location.startswith("https://")
    assert SOURCES[1].location.endswith("DavidWise01")
    assert SOURCES[2].status == "unresolved"
    print("P23 PASS: 0root.ai + DavidWise01 registered; Fiddler01 left unguessed")

if __name__ == "__main__": main()
