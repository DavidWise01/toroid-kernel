"""Petals P49: local CLI status for the three-source Posi hallway."""
import argparse
import json

def status(result: str)->dict[str,str|int]:
    if result not in {"aligned","drift","missing"}: raise ValueError("result must be aligned, drift, or missing")
    return {"sources":3,"result":result,
            "display":"OBSERVATION_ALLOWED" if result=="aligned" else "HALTED",
            "control":"none","scope":"loopback"}

def main()->None:
    parser=argparse.ArgumentParser()
    parser.add_argument("--result",default="aligned")
    args=parser.parse_args()
    print(json.dumps(status(args.result),sort_keys=True))

if __name__=="__main__": main()
