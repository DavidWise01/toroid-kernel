"""Petals P26: normalize webpage and Git sources for Posi input."""
from dataclasses import dataclass
from enum import Enum

class SourceKind(Enum):
    WEBPAGE="webpage"
    GIT="git"

@dataclass(frozen=True)
class PosiInput:
    name: str
    uri: str
    kind: SourceKind
    mode: str = "read-only"

def adapt(name: str, uri: str, kind: SourceKind) -> PosiInput:
    if not name or not uri.startswith("https://"):
        raise ValueError("source must have a name and HTTPS URI")
    return PosiInput(name, uri, kind)

def main() -> None:
    inputs=(
        adapt("0root.ai","https://0root.ai/",SourceKind.WEBPAGE),
        adapt("DavidWise01","https://github.com/DavidWise01",SourceKind.GIT),
        adapt("rgiskard01-fiddler","https://github.com/rgiskard01-fiddler",SourceKind.GIT),
    )
    assert len(inputs)==3
    assert inputs[0].kind is SourceKind.WEBPAGE
    assert all(item.mode=="read-only" for item in inputs)
    try: adapt("bad","http://not-https",SourceKind.WEBPAGE)
    except ValueError: pass
    else: raise AssertionError("insecure URI was accepted")
    print("P26 PASS: webpage and Git sources normalized as read-only Posi inputs")

if __name__=="__main__": main()
