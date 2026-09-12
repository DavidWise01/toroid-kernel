"""Petals P51: local orchestrator for private Posi checkpoint."""
import json, subprocess, sys, time
from urllib.request import urlopen

def run_checkpoint()->dict[str,object]:
    port=18767
    p=subprocess.Popen([sys.executable,"petal_p17_posi_runtime_core.py","--serve","--port",str(port)],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
    try:
        for _ in range(30):
            try:
                with urlopen(f"http://127.0.0.1:{port}/",timeout=1) as r: runtime=json.loads(r.read())
                assert runtime=={"runtime":"posi","state":"ready","ticks":0,"scope":"loopback"}
                return {"runtime":runtime,"triad":"aligned","display":"OBSERVATION_ALLOWED","control":"none","online":True}
            except Exception: time.sleep(.1)
        raise RuntimeError("local Posi runtime did not answer")
    finally:
        p.terminate(); p.wait(timeout=3)

def main()->None:
    report=run_checkpoint()
    assert report["online"] is True and report["control"]=="none"
    print("P51 PASS: local orchestrator verified private Posi checkpoint")
    print(json.dumps(report,sort_keys=True))

if __name__=="__main__": main()
