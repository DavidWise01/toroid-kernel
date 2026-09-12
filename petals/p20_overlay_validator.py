"""Petals P20: validate the 0root.ai AI guidance overlay."""

REQUIRED_ORDER = (
    "Architecture and authority boundaries",
    "Petals peer and resource policies",
    "Posi host, bundle, admission, and audit contracts",
    "Verified local runtime status",
)

def validate_llms(text: str) -> bool:
    positions = [text.find(item) for item in REQUIRED_ORDER]
    return all(position >= 0 for position in positions) and positions == sorted(positions)

def validate_robots(text: str) -> bool:
    return "User-agent: *" in text and "Allow: /" in text

def main() -> None:
    llms = "\n".join(REQUIRED_ORDER)
    robots = "User-agent: *\nAllow: /\n"
    assert validate_llms(llms)
    assert validate_robots(robots)
    assert not validate_llms(REQUIRED_ORDER[1] + "\n" + REQUIRED_ORDER[0])
    assert not validate_robots("User-agent: *\nDisallow: /\n")
    print("P20 PASS: AI reading order and crawler overlay validated")

if __name__ == "__main__":
    main()
