/-!
Code Veronica I5: interpreted status.

The intellect converts a value and tolerance band into one of three statuses:
low, stable, or high.
-/

inductive Status where
  | low | stable | high
deriving DecidableEq

def statusOf (value target radius : Int) : Status :=
  if value < target - radius then .low
  else if target + radius < value then .high
  else .stable

def J_CodeVeronicaI5 : Int → Int → Int → Status := statusOf

theorem status_low : statusOf 8 10 1 = .low := by
  rfl

theorem status_stable : statusOf 10 10 1 = .stable := by
  rfl

theorem status_high : statusOf 12 10 1 = .high := by
  rfl

theorem status_lower_boundary_is_stable : statusOf 9 10 1 = .stable := by
  rfl

theorem status_upper_boundary_is_stable : statusOf 11 10 1 = .stable := by
  rfl
