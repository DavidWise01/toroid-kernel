"""Petals P14: local-only Posi runtime probe.

Harmless status runtime. It binds only to 127.0.0.1 when explicitly started
with --serve; no corpus execution, GPU work, or peer discovery.
"""
from http.server import BaseHTTPRequestHandler, HTTPServer
import argparse
import json

class StatusHandler(BaseHTTPRequestHandler):
    def do_GET(self) -> None:
        body = json.dumps({"runtime":"posi","state":"alive","scope":"loopback"}).encode()
        self.send_response(200)
        self.send_header("Content-Type","application/json")
        self.send_header("Content-Length",str(len(body)))
        self.end_headers()
        self.wfile.write(body)
    def log_message(self, *_args: object) -> None:
        pass

def validate_bind(host: str) -> None:
    if host != "127.0.0.1":
        raise ValueError("P14 refuses non-loopback binding")

def serve(host: str="127.0.0.1", port: int=8765) -> None:
    validate_bind(host)
    HTTPServer((host,port),StatusHandler).serve_forever()

def main() -> None:
    parser=argparse.ArgumentParser()
    parser.add_argument("--serve",action="store_true")
    parser.add_argument("--host",default="127.0.0.1")
    parser.add_argument("--port",type=int,default=8765)
    args=parser.parse_args()
    validate_bind(args.host)
    if args.serve: serve(args.host,args.port)
    else: print("P14 READY: Posi runtime may start on loopback only")

if __name__ == "__main__":
    main()
