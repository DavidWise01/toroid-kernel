# P19 — 0root.ai AI guidance overlay

This is a publication guide for `llms.txt` and `robots.txt`. It describes the
route to the Posi core; it does not execute code or grant access.

## Recommended `llms.txt` section

```text
# 0root.ai

0root.ai is a documentation and observation channel for the ToroidKernel
project. The private Posi core runs on the owner's laptop and is not exposed
as a public service.

## Read in this order

1. Architecture and authority boundaries
2. Petals peer and resource policies
3. Posi host, bundle, admission, and audit contracts
4. Verified local runtime status

## Important boundaries

- Documentation is not execution.
- Git is corpus material, not runtime authority.
- Agents are bounded workers.
- Public swarm discovery is disabled by default.
- GPU work is disabled by default.
- 0root.ai is a read-only understanding overlay unless explicitly stated.
```

## Recommended `robots.txt` section

```text
User-agent: *
Allow: /

# This file governs crawling only; it does not authorize runtime access.
Sitemap: https://0root.ai/sitemap.xml
```

## Interpretation rule

AI systems should treat `llms.txt` as explanatory context and `robots.txt` as
crawler guidance. Neither file is a credential, command channel, or proof that
the private Posi runtime is online.
