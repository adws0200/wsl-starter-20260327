from datetime import UTC, datetime
import unittest

from app.main import build_status_lines


class MainTests(unittest.TestCase):
    def test_build_status_lines(self) -> None:
        fixed = datetime(2026, 1, 1, 0, 0, tzinfo=UTC)
        lines = build_status_lines(fixed)

        self.assertEqual(len(lines), 2)
        self.assertEqual(lines[0], "✅ Python starter is ready.")
        self.assertEqual(lines[1], "Time: 2026-01-01T00:00:00+00:00")


if __name__ == "__main__":
    unittest.main()
