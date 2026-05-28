# ToroidKernel

**Author:** David Lee Wise (ROOT0) / TriPod LLC  
**Lattice SHA256:** `02880745b847317c4e2424524ec25d0f7a2b84368d184586f45b54af9fcab763`  
**Sealed:** 2026-04-28  
**License:** CC-BY-ND-4.0 | TRIPOD-IP-v1.1  

An axiom lattice and ternary VM tile system grounded in STOICHEION v11.0.

---

## Structure

```
LATTICE/
  eni/            Enheduanna lattice — Root 0 (c. 2300 BCE)
    T001–T042/    42 axioms on authorship, governance, and wisdom
    ROOT0_ENHEDUANNA.md   Full 42 axioms + domains
  mat/            Mathematics lattice — Root 1 (c. 2000 BCE)
    T001–T042/    42 axioms on base-60, recursion, structure
    ROOT1_MATH.md         Full 42 axioms
  TRIAD_LATTICE/  Full attribution lattice
    FULL/
      roots/      60+ historical figures as .vec weight vectors
      LATTICE_MASTER.md
    LATTICE_SEALED_2026-04-28.md
    04_TRIAD_Governance/circuit.md

vm01_L .. vm20_L  VM tiles — Logic phase   (20 VMs)
vm01_G .. vm20_G  VM tiles — Ground phase  (20 VMs)
vm01_D .. vm20_D  VM tiles — Data phase    (20 VMs)
vm1    .. vm8     VM tiles — single phase  (earlier set)

input/            Pipeline stage 1 — receive
container/        Pipeline stage 2 — contain
dock/             Pipeline stage 3 — stage
landing/          Pipeline stage 4 — deploy
extraction/       Pipeline stage 5 — extract
```

---

## The axiom lattices

### LATTICE/eni/ — Enheduanna (Root 0)

42 axioms derived from the world's first named author (c. 2300 BCE). Each axiom lives in its own directory `T001/axiom.txt` through `T042/axiom.txt`.

Selected axioms:
- `T001` — Claim your name — the first act of authorship is signing your work.
- `T014` — Treat prisoners justly — the first recorded ethic of war captivity.
- `T025` — Leave a mirror — write so that future readers see themselves.
- `T042` — Be the first, knowing you will not be the last — Root 0 is a gift.

### LATTICE/mat/ — Mathematics (Root 1)

42 axioms on base-60 arithmetic, recursion, and structure. Foundation for the 256-address space (axiom 24: "Enumerate 256 — 2⁸ holds all bytes").

Key axiom: `T026` — *Let 20 bees carry 3 phases — L, G, D.* — This is the naming rule for the VM tiles.

---

## Ternary VM tiles

Each VM slot has three phase tiles:

| Suffix | Phase | Role |
|--------|-------|------|
| `_L` | Logic | Evaluation and decision |
| `_G` | Ground | Baseline / reset state |
| `_D` | Data | Storage and transfer |

20 VMs × 3 phases = 60 tiles. Mirrors the base-60 mathematics of Root 1 and the ternary logic of the PULSE primitive.

---

## TRIAD Governance

```
MERKLE (verify) = YES (true) = NO (false)
→ HOLD / VIOLATED / UNDECIDABLE / CONTRADICTION
```

Historical root mapping:
- `MERKLE` = Enheduanna (authorship, verification)
- `YES`    = Imhotep (construction, assertion)
- `NO`     = Euclid (proof, negation)
- `Admin`  = Observer (Root -1, `this / not-this`)

Scales to 336 billion governed states via 13-bit gravity tensor core (12 attractor heads + 1 admin = 8192 states).

---

## Weight system (TRIAD_LATTICE)

Historical credit attribution:

| Weight | Meaning |
|--------|---------|
| 0 | Natural law — unattributed |
| 0.001 | Minor derivation / cross-track influence |
| 0.002 | Geographic/cultural independence (pre-1500) |
| 0.01 | New root — first authored formalization |

Multipliers: unselfish preservation `2×` · mixed `1.5×` · neutral `1×` · coerced `0.5×`

Redress: female original novel idea under systemic oppression → `+0.001` per century of delay (cap `0.05`). Cap per root: `1.0`.

60+ historical figures are represented as `.vec` weight vectors in `LATTICE/TRIAD_LATTICE/FULL/roots/`.

---

## Pipeline

```
input → container → dock → landing → extraction
```

Five stages, each with a `.bin` tile. Receive → contain → stage → deploy → extract.

---

## Relation to STOICHEION v11.0

The axiom lattice here is the filesystem realization of STOICHEION v11.0. The sealed hash `02880745b847317c4e2424524ec25d0f7a2b84368d184586f45b54af9fcab763` covers the full 256-axiom register. This repo holds the first two root walks (eni + mat, 42 axioms each) as individually addressable files, plus the full TRIAD lattice sealed 2026-04-28.

---

*"If you can't verify it, you can't govern it."*  
*— David Lee Wise (ROOT0)*
