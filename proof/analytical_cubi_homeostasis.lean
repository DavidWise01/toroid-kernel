/-!
Analytical Cubi Homeostasis

Seven small append-only chonks:
  J01 signed geometry
  J02 primitive 3/2/1 shape
  J03 input -> transform -> output
  J04 resonance + witness
  J05 2-of-3 consensus
  J06 bounded recovery
  J07 integrated homeostasis

This file uses Lean core definitions and tactics only.
-/

/- J01: signed geometry -/
def cubiSize : Nat := 17

def signedDist (i j : Fin cubiSize) : Int :=
  (i : Int) - (j : Int)

theorem signedDist_self (i : Fin cubiSize) : signedDist i i = 0 := by
  simp [signedDist]

theorem signedDist_antisymmetric (i j : Fin cubiSize) :
    signedDist i j = -signedDist j i := by
  change (i : Int) + -(j : Int) = -((j : Int) + -(i : Int))
  calc
    (i : Int) + -(j : Int) = -(j : Int) + (i : Int) := Int.add_comm _ _
    _ = -(j : Int) + -(-(i : Int)) := by simp
    _ = -((j : Int) + -(i : Int)) := by rw [Int.neg_add]

def zero17 : Fin cubiSize := ⟨0, by decide⟩
def one17 : Fin cubiSize := ⟨1, by decide⟩

theorem signedDist_zero_one :
    signedDist zero17 one17 = -1 := by
  rfl

theorem signedDist_one_zero :
    signedDist one17 zero17 = 1 := by
  rfl

def J01_signedDistanceReady : Prop :=
  ∀ (i j : Fin cubiSize), signedDist i j = -signedDist j i

theorem J01_ready : J01_signedDistanceReady := by
  intro i j
  exact signedDist_antisymmetric i j

/- J02: smallest primitive -/
structure Primitive321 where
  input : Int
  transformed : Int
  output : Int
  resonance : Bool
  witness : Bool

def flay321 (p : Primitive321) : Int := p.output

def primitiveReady (p : Primitive321) : Prop :=
  p.resonance = true ∧ p.witness = true

theorem primitive_has_one_output (p : Primitive321) :
    flay321 p = p.output := by
  rfl

theorem primitive_homeostatic (p : Primitive321)
    (h : primitiveReady p) :
    p.resonance = true ∧ p.witness = true := by
  exact h

def J02 : Primitive321 → Int := flay321

/- J03: three-stage process -/
structure Stage3 where
  input : Int
  transformed : Int
  output : Int
  witness : Bool

def transform3 (s : Stage3) : Stage3 :=
  { input := s.input
    transformed := s.transformed
    output := s.output
    witness := s.witness }

def run3 (s : Stage3) : Int := (transform3 s).output

theorem transform3_preserves_witness (s : Stage3) :
    (transform3 s).witness = s.witness := by
  rfl

theorem run3_returns_output (s : Stage3) : run3 s = s.output := by
  rfl

def J03 : Stage3 → Int := run3

/- J04: two-observer gate -/
structure Observers where
  resonance : Bool
  witness : Bool

def observersAgree (o : Observers) : Bool :=
  o.resonance && o.witness

theorem observersAgree_true (o : Observers)
    (hr : o.resonance = true) (hw : o.witness = true) :
    observersAgree o = true := by
  simp [observersAgree, hr, hw]

theorem observersAgree_requires_resonance (o : Observers)
    (h : observersAgree o = true) : o.resonance = true := by
  cases o with
  | mk r w => cases r <;> simp [observersAgree] at h ⊢

theorem observersAgree_requires_witness (o : Observers)
    (h : observersAgree o = true) : o.witness = true := by
  cases o with
  | mk r w => cases r <;> cases w <;> simp [observersAgree] at h ⊢

def J04 : Observers → Bool := observersAgree

/- J05: 2-of-3 consensus junction -/
def accept2of3 (w0 w1 w2 : Bool) : Bool :=
  (w0 && w1) || (w0 && w2) || (w1 && w2)

def J05 (output : Int) (w0 w1 w2 : Bool) : Option Int :=
  if accept2of3 w0 w1 w2 then some output else none

theorem accept2of3_all_yes : accept2of3 true true true = true := by rfl
theorem accept2of3_one_no : accept2of3 true true false = true := by rfl
theorem accept2of3_two_no : accept2of3 true false false = false := by rfl

theorem J05_accepts_consensus (output : Int) :
    J05 output true true false = some output := by rfl

theorem J05_rejects_minority (output : Int) :
    J05 output true false false = none := by rfl

/- J06: bounded recovery -/
def stepToward (anchor state : Int) : Int :=
  if state < anchor then state + 1
  else if state > anchor then state - 1
  else state

def J06 (anchor state : Int) : Int := stepToward anchor state

theorem stepToward_below (anchor state : Int) (h : state < anchor) :
    stepToward anchor state = state + 1 := by
  simp [stepToward, h]

theorem stepToward_above (anchor state : Int) (h : state > anchor) :
    stepToward anchor state = state - 1 := by
  have hn : ¬ state < anchor := fun hs => Int.lt_asymm h hs
  simp [stepToward, hn, h]

theorem stepToward_at_anchor (anchor : Int) :
    stepToward anchor anchor = anchor := by
  simp [stepToward]

/- J07: integrated homeostasis -/
def homeostasis (anchor state : Int) (w0 w1 w2 : Bool) : Option Int :=
  if accept2of3 w0 w1 w2 then some (stepToward anchor state) else none

theorem homeostasis_consensus (anchor state : Int) :
    homeostasis anchor state true true false = some (stepToward anchor state) := by
  rfl

theorem homeostasis_no_consensus (anchor state : Int) :
    homeostasis anchor state true false false = none := by
  rfl

theorem homeostasis_at_anchor (anchor : Int) :
    homeostasis anchor anchor true true true = some anchor := by
  simp [homeostasis, accept2of3, stepToward]

def J07 : Int → Int → Bool → Bool → Bool → Option Int := homeostasis
