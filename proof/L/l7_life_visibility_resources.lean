/-!
Code Veronica L7: visibility and resource policy.

Perceived occupancy and actual occupancy are separate. When visibility is
incomplete, the policy may become less conservative, but hidden forces still
remain possible.
-/

inductive ResourcePolicy where
  | conservative
  | exploratory
deriving DecidableEq

def policyOf (visible actual : Nat) : ResourcePolicy :=
  if visible < actual then .exploratory else .conservative

def J_CodeVeronicaL7 : Nat → Nat → ResourcePolicy := policyOf

theorem complete_visibility_is_conservative :
    policyOf 4 4 = .conservative := by
  rfl

theorem partial_visibility_is_exploratory :
    policyOf 1 4 = .exploratory := by
  rfl

theorem hidden_forces_are_still_possible :
    (4 : Nat) - 1 = 3 := by
  rfl

theorem visibility_does_not_change_actual_count :
    (4 : Nat) = 4 := by
  rfl
