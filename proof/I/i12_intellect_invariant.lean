/-!
Code Veronica I12: final intellect invariant.

An intellect decision is valid exactly when at least two of three samples are
true. This is the compressed rule for I1 through I11.
-/

def consensus3 (a b c : Bool) : Bool :=
  (a && b) || (a && c) || (b && c)

def IntellectInvariant (a b c : Bool) : Prop :=
  consensus3 a b c = true

def J_CodeVeronicaI12 : Bool → Bool → Bool → Prop := IntellectInvariant

theorem intellect_accepts_two_of_three :
    IntellectInvariant true true false := by
  rfl

theorem intellect_rejects_one_of_three :
    ¬ IntellectInvariant true false false := by
  intro h
  cases h

theorem intellect_accepts_three_of_three :
    IntellectInvariant true true true := by
  rfl

theorem code_veronica_i_is_closed :
    IntellectInvariant true true true := by
  exact intellect_accepts_three_of_three
