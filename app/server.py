from __future__ import annotations

from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import os

SERVICE_NAME = "wsl-starter-20260327-py"


class Handler(BaseHTTPRequestHandler):
    def do_GET(self) -> None:  # noqa: N802 (BaseHTTPRequestHandler API)
        if self.path.startswith("/health"):
            payload = json.dumps({"ok": True, "service": SERVICE_NAME}).encode("utf-8")
            self.send_response(200)
            self.send_header("Content-Type", "application/json; charset=utf-8")
            self.send_header("Content-Length", str(len(payload)))
            self.end_headers()
            self.wfile.write(payload)
            return

        body = b"Hello from Python server\n"
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, format: str, *args) -> None:  # noqa: A003
        # Keep starter output clean during local runs/tests.
        return


def make_server(host: str = "127.0.0.1", port: int = 8000) -> HTTPServer:
    return HTTPServer((host, port), Handler)


def main() -> None:
    port = int(os.getenv("PY_PORT", "8000"))
    server = make_server(port=port)
    print(f"🚀 Python server listening on http://127.0.0.1:{port}")
    server.serve_forever()


if __name__ == "__main__":
    main()
