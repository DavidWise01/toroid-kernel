/-!
Chonk 28: witnessed transition acceptance.

The cortex accepts a transition only when its identity is continuous, its
movement is valid, and a witness is present.
-/

structure TransitionCheck where
  identityContinuous : Bool
  movementValid : Bool
  witnessed : Bool

def accepted (check : TransitionCheck) : Bool :=
  check.identityContinuous && check.movementValid && check.witnessed

def J28 : TransitionCheck → Bool := accepted

theorem accepted_when_all_true :
    accepted { identityContinuous := true, movementValid := true, witnessed := true } = true := by
  rfl

theorem rejected_without_witness :
    accepted { identityContinuous := true, movementValid := true, witnessed := false } = false := by
  rfl

theorem rejected_without_continuity :
    accepted { identityContinuous := false, movementValid := true, witnessed := true } = false := by
  rfl

theorem accepted_requires_witness (check : TransitionCheck)
    (h : accepted check = true) : check.witnessed = true := by
  cases check with
  | mk i m w => cases i <;> cases m <;> cases w <;> simp [accepted] at h ⊢

