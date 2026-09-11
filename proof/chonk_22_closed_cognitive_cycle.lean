/-!
Chonk 22: closed cognitive cycle.

Observe a current state, compare it with memory, classify feedback, choose
an action, and execute one bounded change.
-/

inductive Feedback where
  | stable
  | rising
  | falling
deriving Repr, DecidableEq

inductive Action where
  | hold
  | advance
  | retreat
deriving Repr, DecidableEq

def classify (current remembered : Int) : Feedback :=
  if current = remembered then .stable
  else if current > remembered then .rising
  else .falling

def choose : Feedback → Action
  | .stable => .hold
  | .rising => .retreat
  | .falling => .advance

def execute (state : Int) : Action → Int
  | .hold => state
  | .advance => state + 1
  | .retreat => state - 1

def cortexCycle (current remembered : Int) : Int :=
  execute current (choose (classify current remembered))

def J22 : Int → Int → Int := cortexCycle

theorem closed_cycle_equal (value : Int) :
    cortexCycle value value = value := by
  simp [cortexCycle, classify, choose, execute]

theorem closed_cycle_rising : cortexCycle 2 1 = 1 := by
  rfl

theorem closed_cycle_falling : cortexCycle 1 2 = 2 := by
  rfl

