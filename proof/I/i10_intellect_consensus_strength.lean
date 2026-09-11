/-!
Code Veronica I10: consensus strength.

The intellect counts how many of three Boolean samples are true. The count is
kept as evidence alongside the consensus decision.
-/

def bit (signal : Bool) : Nat :=
  if signal then 1 else 0

def strength (a b c : Bool) : Nat :=
  bit a + bit b + bit c

def J_CodeVeronicaI10 : Bool → Bool → Bool → Nat := strength

theorem strength_zero : strength false false false = 0 := by
  rfl

theorem strength_one : strength true false false = 1 := by
  rfl

theorem strength_two : strength true true false = 2 := by
  rfl

theorem strength_three : strength true true true = 3 := by
  rfl
