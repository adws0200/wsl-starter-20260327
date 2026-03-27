from __future__ import annotations

import json
import threading
import unittest
import urllib.request

from app.server import make_server, SERVICE_NAME


class ServerTests(unittest.TestCase):
    def test_health_endpoint(self) -> None:
        server = make_server(port=0)
        thread = threading.Thread(target=server.serve_forever, daemon=True)
        thread.start()

        try:
            host, port = server.server_address
            with urllib.request.urlopen(f"http://{host}:{port}/health", timeout=3) as res:
                body = res.read().decode("utf-8")

            payload = json.loads(body)
            self.assertTrue(payload["ok"])
            self.assertEqual(payload["service"], SERVICE_NAME)
        finally:
            server.shutdown()
            server.server_close()
            thread.join(timeout=2)


if __name__ == "__main__":
    unittest.main()
