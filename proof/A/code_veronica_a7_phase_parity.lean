/-!
Code Veronica A7: phase parity.

Completed animation cycles alternate between two phases. Frame motion and
phase accounting remain separate.
-/

inductive AnimationPhase where
  | phaseEven | phaseOdd
deriving DecidableEq

def phaseOf (cycles : Nat) : AnimationPhase :=
  if cycles % 2 = 0 then .phaseEven else .phaseOdd

def J_CodeVeronicaA7 : Nat → AnimationPhase := phaseOf

theorem zero_is_even_phase : phaseOf 0 = .phaseEven := by
  rfl

theorem one_is_odd_phase : phaseOf 1 = .phaseOdd := by
  rfl

theorem two_returns_to_even_phase : phaseOf 2 = .phaseEven := by
  rfl

theorem three_is_odd_phase : phaseOf 3 = .phaseOdd := by
  rfl
