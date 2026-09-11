/-!
Cleave 2 / Alpha descent.

Alpha is the symbolic outer limit. The executable descent is the finite ladder
of powers 10 down to 0.
-/

def AlphaExponent := Nat

def alphaNext (exponent : AlphaExponent) : AlphaExponent :=
  match exponent with
  | 0 => 0
  | n + 1 => n

def J_Cleave2Alpha : AlphaExponent → AlphaExponent := alphaNext

theorem alpha_descent_reaches_zero :
    alphaNext (alphaNext (alphaNext (alphaNext (alphaNext
      (alphaNext (alphaNext (alphaNext (alphaNext (alphaNext 10)))))))))) = 0 := by
  rfl

theorem alpha_zero_is_stable : alphaNext 0 = 0 := by
  rfl

theorem alpha_step_never_increases (exponent : AlphaExponent) :
    alphaNext exponent ≤ exponent := by
  cases exponent <;> simp [alphaNext]
