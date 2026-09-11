# Petals network layer

Petals is the project name for the staged, backend-neutral network layer in
ToroidKernel. It is not Google's incident-priority naming scheme.

## Current status

- P1–P5: foundation and client configuration
- P6: explicit peer-policy gate
- Default: public peer discovery denied
- Default: no sockets, no swarm joining, no GPU worker

The P6 reference implementation is `p6_peer_policy.py`. It only evaluates
whether a requested peer is approved; transport and GPU execution are separate
future stages.

Run the local check:

```text
python p6_peer_policy.py
P6 PASS: explicit peer allowlist enforced; public discovery denied
```
