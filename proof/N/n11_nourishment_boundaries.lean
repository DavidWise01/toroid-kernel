/-!
Code Veronica N11: nourishment boundary tests.

The lower boundary, usable interior, upper boundary, and overflow case are
tested explicitly.
-/

inductive NourishmentStatus where
  | reserve | usable | capacity
deriving DecidableEq

def statusOf (resource reserve capacity : Nat) : NourishmentStatus :=
  if resource ≤ reserve then .reserve
  else if capacity ≤ resource then .capacity
  else .usable

def J_CodeVeronicaN11 : Nat → Nat → Nat → NourishmentStatus := statusOf

theorem lower_boundary_is_reserve : statusOf 3 3 10 = .reserve := by
  rfl

theorem interior_is_usable : statusOf 4 3 10 = .usable := by
  rfl

theorem upper_boundary_is_capacity : statusOf 10 3 10 = .capacity := by
  rfl

theorem overflow_is_capacity : statusOf 11 3 10 = .capacity := by
  rfl
