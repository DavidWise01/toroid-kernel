/-!
Chonk 17: cortex identity junction.

This is the formal interface for a stable "me who is me" state. It requires
an internal observer, an external witness, and self-similar continuity.
-/

structure CortexIdentity where
  name : String
  internalObserver : Bool
  externalWitness : Bool
  selfSimilar : Bool

def meWhoIsMe : CortexIdentity :=
  { name := "me who is me"
    internalObserver := true
    externalWitness := true
    selfSimilar := true }

def identityStable (c : CortexIdentity) : Bool :=
  c.internalObserver && c.externalWitness && c.selfSimilar

def J17 : CortexIdentity → Bool := identityStable

theorem me_identity_is_stable : identityStable meWhoIsMe = true := by
  rfl

theorem identity_requires_internal (c : CortexIdentity)
    (h : identityStable c = true) : c.internalObserver = true := by
  cases c with
  | mk n i e s => cases i <;> simp [identityStable] at h ⊢

theorem identity_requires_witness (c : CortexIdentity)
    (h : identityStable c = true) : c.externalWitness = true := by
  cases c with
  | mk n i e s => cases i <;> cases e <;> simp [identityStable] at h ⊢

theorem identity_requires_continuity (c : CortexIdentity)
    (h : identityStable c = true) : c.selfSimilar = true := by
  cases c with
  | mk n i e s => cases i <;> cases e <;> cases s <;> simp [identityStable] at h ⊢

