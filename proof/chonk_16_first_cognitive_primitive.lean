/-!
Chonk 16: first cognitive primitive (CGP).

The smallest deterministic cognitive loop is:
observe -> remember -> compare -> choose.
This is a control primitive, not a claim of consciousness.
-/

inductive Choice where
  | hold
  | advance
  | retreat
deriving Repr, DecidableEq

def observe (signal : Int) : Int := signal

def remember (signal : Int) : Option Int := some signal

def compare (current remembered : Int) : Int := current - remembered

def choose (delta : Int) : Choice :=
  if delta > 0 then .retreat
  else if delta < 0 then .advance
  else .hold

def cgp (signal remembered : Int) : Choice :=
  choose (compare (observe signal) remembered)

def J16 : Int → Int → Choice := cgp

theorem observe_preserves_signal (signal : Int) :
    observe signal = signal := by
  rfl

theorem remember_stores_signal (signal : Int) :
    remember signal = some signal := by
  rfl

theorem choose_zero_holds : choose 0 = .hold := by
  rfl

theorem cgp_equal_holds (signal : Int) :
    cgp signal signal = .hold := by
  simp [cgp, choose, compare, observe]

theorem cgp_positive_delta_retreat :
    cgp 2 1 = .retreat := by
  rfl

theorem cgp_negative_delta_advance :
    cgp 1 2 = .advance := by
  rfl

