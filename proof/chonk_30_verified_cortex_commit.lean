/-!
Chonk 30: verified cortex commit gate.

The canonical cortex state advances only when admission, witness, and
sequence continuity all agree.
-/

structure CommitCheck where
  transitionAccepted : Bool
  witnessed : Bool
  sequenceContinuous : Bool

def commitAllowed (check : CommitCheck) : Bool :=
  check.transitionAccepted && check.witnessed && check.sequenceContinuous

def J30 : CommitCheck → Bool := commitAllowed

theorem verified_commit_allowed :
    commitAllowed
      { transitionAccepted := true, witnessed := true, sequenceContinuous := true } = true := by
  rfl

theorem unwitnessed_commit_blocked :
    commitAllowed
      { transitionAccepted := true, witnessed := false, sequenceContinuous := true } = false := by
  rfl

theorem gapped_commit_blocked :
    commitAllowed
      { transitionAccepted := true, witnessed := true, sequenceContinuous := false } = false := by
  rfl

theorem commit_requires_all_three (check : CommitCheck)
    (h : commitAllowed check = true) :
    check.transitionAccepted = true ∧
    check.witnessed = true ∧
    check.sequenceContinuous = true := by
  cases check with
  | mk a w s => cases a <;> cases w <;> cases s <;> simp [commitAllowed] at h ⊢

