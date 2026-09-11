/-!
Code Veronica N9: bilateral nourishment balance.

The left and right stores are considered balanced when neither exceeds the
other by more than one unit.
-/

def bilateralBalanced (left right : Nat) : Prop :=
  left ≤ right + 1 ∧ right ≤ left + 1

def J_CodeVeronicaN9 : Nat → Nat → Prop := bilateralBalanced

theorem equal_stores_are_balanced : bilateralBalanced 5 5 := by
  constructor <;> decide

theorem one_unit_difference_is_balanced : bilateralBalanced 5 6 := by
  constructor <;> decide

theorem two_unit_difference_is_unbalanced : ¬ bilateralBalanced 5 7 := by
  intro h
  decide at h
