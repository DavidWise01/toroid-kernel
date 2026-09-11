/-!
Chonk 35: validate both ganglion anchors before bridge use.

Each anchor receives its own exact tolerance check. The dual bridge is
admissible only when A and B both pass.
-/

def tolerance : Int := 250

def withinBand (anchor sample : Int) : Prop :=
  Int.natAbs (sample - anchor) ≤ Int.toNat tolerance

structure DualGanglion where
  anchorA : Int
  sampleA : Int
  anchorB : Int
  sampleB : Int

def dualValid (g : DualGanglion) : Prop :=
  withinBand g.anchorA g.sampleA ∧ withinBand g.anchorB g.sampleB

def J35 : DualGanglion → Prop := dualValid

theorem dual_ganglion_valid :
    dualValid { anchorA := 10000, sampleA := 10250,
                anchorB := 20000, sampleB := 19750 } := by
  decide

theorem dual_ganglion_rejects_bad_A :
    ¬ dualValid { anchorA := 10000, sampleA := 10251,
                  anchorB := 20000, sampleB := 20000 } := by
  decide

theorem dual_ganglion_rejects_bad_B :
    ¬ dualValid { anchorA := 10000, sampleA := 10000,
                  anchorB := 20000, sampleB := 19749 } := by
  decide

