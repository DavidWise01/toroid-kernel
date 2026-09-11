/-!
Chonk 09: powers of ten as phase steps.

This separates ordinary arithmetic from the phase interpretation:
10^n remains an exact natural number, while its exponent is recorded as
the phase count. The stable endpoints are explicit states, not arithmetic
claims that a finite power literally equals infinity.
-/

inductive Phase10 where
  | one
  | step (exponent : Nat)
  | infinity
deriving Repr, DecidableEq

def power10 (exponent : Nat) : Nat := 10 ^ exponent

def phaseOfExponent : Nat → Phase10
  | 0 => .one
  | n + 1 => .step (n + 1)

def foldPhase : Phase10 → Phase10
  | .one => .one
  | .step n => .step n
  | .infinity => .infinity

def J09 (exponent : Nat) : Phase10 :=
  foldPhase (phaseOfExponent exponent)

theorem power10_zero : power10 0 = 1 := by
  rfl

theorem power10_one : power10 1 = 10 := by
  rfl

theorem power10_two : power10 2 = 100 := by
  rfl

theorem phase_zero_is_one : phaseOfExponent 0 = .one := by
  rfl

theorem phase_positive_is_step (n : Nat) :
    phaseOfExponent (n + 1) = .step (n + 1) := by
  rfl

theorem fold_one_stable : foldPhase .one = .one := by
  rfl

theorem fold_infinity_stable : foldPhase .infinity = .infinity := by
  rfl

theorem J09_zero_stable : J09 0 = .one := by
  rfl

theorem J09_ten_is_first_step : J09 1 = .step 1 := by
  rfl

