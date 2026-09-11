/-!
Code Veronica I1: intellect decision kernel.

The smallest intellect unit observes a value, compares it with a target, and
returns one deterministic decision.
-/

inductive Decision where
  | below | equal | above
deriving DecidableEq

def decide (value target : Int) : Decision :=
  if value < target then .below
  else if value = target then .equal
  else .above

def J_CodeVeronicaI1 : Int → Int → Decision := decide

theorem intellect_below : decide 2 3 = .below := by
  rfl

theorem intellect_equal : decide 3 3 = .equal := by
  rfl

theorem intellect_above : decide 4 3 = .above := by
  rfl
