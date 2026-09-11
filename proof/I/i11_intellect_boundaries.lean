/-!
Code Veronica I11: intellect decision boundaries.

The consensus threshold is tested at its edge: one true sample is insufficient,
while two true samples are sufficient.
-/

def consensus3 (a b c : Bool) : Bool :=
  (a && b) || (a && c) || (b && c)

def J_CodeVeronicaI11 : Bool → Bool → Bool → Bool := consensus3

theorem one_sample_is_rejected : consensus3 true false false = false := by
  rfl

theorem two_samples_are_accepted : consensus3 true true false = true := by
  rfl

theorem three_samples_are_accepted : consensus3 true true true = true := by
  rfl
