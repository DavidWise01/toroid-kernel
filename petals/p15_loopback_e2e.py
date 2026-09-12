"""Petals P15: end-to-end loopback test for the Posi runtime."""
import json
import subprocess
import sys
import time
from urllib.request import urlopen

def main() -> None:
    port = 18765
    process = subprocess.Popen(
        [sys.executable, "petal_p14_local_posi_runtime.py", "--serve",
         "--port", str(port)],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    try:
        for _ in range(30):
            try:
                with urlopen(f"http://127.0.0.1:{port}/", timeout=1) as response:
                    payload = json.loads(response.read())
                assert payload == {"runtime":"posi","state":"alive","scope":"loopback"}
                print("P15 PASS: loopback runtime answered with verified Posi status")
                return
            except Exception:
                time.sleep(0.1)
        raise RuntimeError("loopback runtime did not answer")
    finally:
        process.terminate()
        process.wait(timeout=3)

if __name__ == "__main__":
    main()
