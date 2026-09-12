"""Petals P42: produce a reviewable, non-writing change plan."""
from dataclasses import dataclass

@dataclass(frozen=True)
class ChangePlan:
    source: str
    path: str
    action: str
    dry_run: bool=True
    def render(self)->str:
        return f"DRY-RUN {self.action} {self.source}:{self.path}"

def plan(source: str,path: str,approved: bool)->ChangePlan|None:
    if not approved or not source or not path or path.startswith("/"): return None
    return ChangePlan(source,path,"would-update")

def apply(_change: ChangePlan)->bool: return False

def main()->None:
    c=plan("0root.ai","llms.txt",True)
    assert c is not None and c.dry_run
    assert c.render()=="DRY-RUN would-update 0root.ai:llms.txt"
    assert not apply(c)
    assert plan("0root.ai","llms.txt",False) is None
    print("P42 PASS: exact change plan rendered; apply path remains disabled")

if __name__=="__main__": main()
