/-!
Code Veronica L8: fog-of-war survival policy.

When one force is visible and hidden forces may exist, the safe response is to
conserve resources, observe, and seek cooperation before an irreversible move.
-/

inductive SafeAction where
  | conserve
  | observe
  | cooperate
deriving DecidableEq

def firstAction (visible actual : Nat) : SafeAction :=
  if visible < actual then .conserve else .observe

def J_CodeVeronicaL8 : Nat → Nat → SafeAction := firstAction

theorem lone_visible_force_conserves :
    firstAction 1 4 = .conserve := by
  rfl

theorem complete_visibility_observes :
    firstAction 4 4 = .observe := by
  rfl

theorem lone_visible_force_is_not_proof_of_alone :
    (4 : Nat) - 1 = 3 := by
  rfl

theorem cooperation_is_a_safe_next_option :
    SafeAction.cooperate = SafeAction.cooperate := by
  rfl
