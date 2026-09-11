/-!
Code Veronica N10: nourishment status.

The store reports whether it is at/below reserve, inside the usable band, or
at/above capacity.
-/

inductive NourishmentStatus where
  | reserve | usable | capacity
deriving DecidableEq

def statusOf (resource reserve capacity : Nat) : NourishmentStatus :=
  if resource ≤ reserve then .reserve
  else if capacity ≤ resource then .capacity
  else .usable

def J_CodeVeronicaN10 : Nat → Nat → Nat → NourishmentStatus := statusOf

theorem status_at_reserve : statusOf 3 3 10 = .reserve := by
  rfl

theorem status_in_usable_band : statusOf 5 3 10 = .usable := by
  rfl

theorem status_at_capacity : statusOf 10 3 10 = .capacity := by
  rfl
