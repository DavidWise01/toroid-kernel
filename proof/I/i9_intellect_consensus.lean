/-!
Code Veronica I9: three-sample consensus.

The intellect accepts a Boolean signal when at least two of three samples
agree. This filters a single noisy sample.
-/

def consensus3 (a b c : Bool) : Bool :=
  (a && b) || (a && c) || (b && c)

def J_CodeVeronicaI9 : Bool → Bool → Bool → Bool := consensus3

theorem consensus_two_true : consensus3 true true false = true := by
  rfl

theorem consensus_one_true : consensus3 true false false = false := by
  rfl

theorem consensus_all_true : consensus3 true true true = true := by
  rfl

theorem consensus_all_false : consensus3 false false false = false := by
  rfl
