/-!
Chonk 27: identity continuity across a validated replay.

If the replay is valid, the cortex keeps its identity label. If replay fails,
identity is withheld rather than silently reassigned.
-/

def identityAfter (identity : String) (historyValid : Bool) : Option String :=
  if historyValid then some identity else none

def J27 : String → Bool → Option String := identityAfter

theorem valid_replay_keeps_identity (identity : String) :
    identityAfter identity true = some identity := by
  rfl

theorem invalid_replay_withholds_identity (identity : String) :
    identityAfter identity false = none := by
  rfl

theorem identity_continuity_is_explicit (identity : String) (historyValid : Bool)
    (h : historyValid = true) :
    identityAfter identity historyValid = some identity := by
  simp [identityAfter, h]

