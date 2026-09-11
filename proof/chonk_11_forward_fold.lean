/-!
Chonk 11: bounded infinity folds forward to phase 1.

This creates a repeatable cycle. `boundedInfinity` is a boundary marker,
not a dead end: the forward fold returns to the first active phase.
-/

inductive CubeOneState where
  | interior (phase : Nat)
  | boundedInfinity
deriving Repr, DecidableEq

def forwardFold : CubeOneState → CubeOneState
  | .boundedInfinity => .interior 1
  | .interior phase => .interior (phase + 1)

def J11 : CubeOneState → CubeOneState := forwardFold

theorem bounded_infinity_folds_to_one :
    forwardFold .boundedInfinity = .interior 1 := by
  rfl

theorem forward_fold_advances (phase : Nat) :
    forwardFold (.interior phase) = .interior (phase + 1) := by
  rfl

theorem forward_fold_repeats :
    forwardFold (forwardFold .boundedInfinity) = .interior 2 := by
  rfl

