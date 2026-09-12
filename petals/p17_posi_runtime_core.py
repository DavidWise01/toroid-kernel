"""Petals P17: loopback runtime exposing deterministic Posi core state."""
from dataclasses import dataclass
from enum import Enum
from http.server import BaseHTTPRequestHandler, HTTPServer
import argparse
import json

class State(Enum):
    BOOT="boot"; READY="ready"; HALT="halt"

@dataclass
class PosiCore:
    state: State = State.BOOT
    ticks: int = 0
    def step(self) -> None:
        if self.state is State.BOOT: self.state=State.READY
        elif self.state is State.READY: self.ticks += 1
    def stop(self) -> None: self.state=State.HALT

CORE=PosiCore()

class Handler(BaseHTTPRequestHandler):
    def do_GET(self) -> None:
        body=json.dumps({"runtime":"posi","state":CORE.state.value,
                          "ticks":CORE.ticks,"scope":"loopback"}).encode()
        self.send_response(200)
        self.send_header("Content-Type","application/json")
        self.send_header("Content-Length",str(len(body)))
        self.end_headers()
        self.wfile.write(body)
    def log_message(self, *_args: object) -> None: pass

def validate_bind(host: str) -> None:
    if host != "127.0.0.1": raise ValueError("P17 refuses non-loopback binding")

def main() -> None:
    parser=argparse.ArgumentParser()
    parser.add_argument("--serve",action="store_true")
    parser.add_argument("--host",default="127.0.0.1")
    parser.add_argument("--port",type=int,default=8766)
    args=parser.parse_args(); validate_bind(args.host)
    if args.serve:
        CORE.step(); HTTPServer((args.host,args.port),Handler).serve_forever()
    else: print("P17 READY: loopback runtime exposes Posi core state")

if __name__ == "__main__": main()
