/-!
Chonk 08: position 10, Neon outer shell.

Neon is used here as an architectural analogy: a closed noble boundary.
The shell contains an inner value and exposes it only when sealed.
It does not alter the inner value.
-/

def outerPosition : Nat := 10

structure NeonShell where
  inner : Int
  sealed : Bool

def expose (s : NeonShell) : Option Int :=
  if s.sealed then some s.inner else none

theorem outerPosition_is_10 : outerPosition = 10 := by
  rfl

theorem sealed_exposes_inner (s : NeonShell) (h : s.sealed = true) :
    expose s = some s.inner := by
  simp [expose, h]

theorem open_shell_exposes_nothing (value : Int) :
    expose { inner := value, sealed := false } = none := by
  rfl

theorem neon_shell_preserves_inner (s : NeonShell) (h : s.sealed = true) :
    ∃ value, expose s = some value ∧ value = s.inner := by
  exact ⟨s.inner, sealed_exposes_inner s h, rfl⟩

/- J08: position 10 hooks inward to the existing homeostasis result. -/
def J08 (s : NeonShell) : Option Int := expose s

