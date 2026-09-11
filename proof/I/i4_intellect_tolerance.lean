/-!
Code Veronica I4: tolerance checking.

An observation is stable when it remains inside a target band with a chosen
radius.
-/

def withinBand (value target radius : Int) : Prop :=
  target - radius ≤ value ∧ value ≤ target + radius

def J_CodeVeronicaI4 : Int → Int → Int → Prop := withinBand

theorem value_inside_band : withinBand 9 10 1 := by
  constructor <;> omega

theorem value_on_lower_boundary : withinBand 9 10 1 := by
  constructor <;> omega

theorem value_on_upper_boundary : withinBand 11 10 1 := by
  constructor <;> omega

theorem value_outside_band : ¬ withinBand 12 10 1 := by
  intro h
  omega
