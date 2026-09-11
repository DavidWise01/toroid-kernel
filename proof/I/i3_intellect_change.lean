/-!
Code Veronica I3: change detection.

The intellect compares a previous observation with a current observation and
classifies the direction of change.
-/

inductive Change where
  | decreased | unchanged | increased
deriving DecidableEq

def detectChange (previous current : Int) : Change :=
  if current < previous then .decreased
  else if current = previous then .unchanged
  else .increased

def J_CodeVeronicaI3 : Int → Int → Change := detectChange

theorem change_decreased : detectChange 5 4 = .decreased := by
  rfl

theorem change_unchanged : detectChange 5 5 = .unchanged := by
  rfl

theorem change_increased : detectChange 5 6 = .increased := by
  rfl
