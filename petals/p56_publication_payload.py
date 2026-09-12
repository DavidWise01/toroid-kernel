"""Petals P56: exact llms.txt and robots.txt publication payloads."""

LLMS_TXT="""# 0root.ai

0root.ai is a documentation and observation channel for the ToroidKernel
project. The private Posi core runs on the owner's laptop and is not exposed
as a public service.

## Read in this order

1. Architecture and authority boundaries
2. Petals peer and resource policies
3. Posi host, bundle, admission, and audit contracts
4. Verified local runtime status

## Boundaries

- Documentation is not execution.
- Git is corpus material, not runtime authority.
- Agents are bounded workers.
- Public swarm discovery and GPU work are disabled by default.
- 0root.ai is a read-only understanding overlay.
"""

ROBOTS_TXT="""User-agent: *
Allow: /

# Crawler guidance only; this does not authorize runtime access.
Sitemap: https://0root.ai/sitemap.xml
"""

def valid_payload()->bool:
    return (LLMS_TXT.startswith("# 0root.ai") and "private Posi core" in LLMS_TXT
            and "Documentation is not execution." in LLMS_TXT
            and ROBOTS_TXT.startswith("User-agent: *\nAllow: /")
            and "runtime access" in ROBOTS_TXT)

def main()->None:
    assert valid_payload()
    assert "Sitemap: https://0root.ai/sitemap.xml" in ROBOTS_TXT
    print("P56 PASS: llms.txt and robots.txt payloads ready for review")

if __name__=="__main__": main()
