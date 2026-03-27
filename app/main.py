from datetime import UTC, datetime


def build_status_lines(now: datetime | None = None) -> list[str]:
    now = now or datetime.now(UTC)
    return [
        "✅ Python starter is ready.",
        f"Time: {now.isoformat()}",
    ]


def main() -> None:
    for line in build_status_lines():
        print(line)


if __name__ == "__main__":
    main()
