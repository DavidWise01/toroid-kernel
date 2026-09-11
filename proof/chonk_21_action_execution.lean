/-!
Chonk 21: bounded action execution.

The action layer changes the state by at most one unit per cycle.
-/

inductive Action where
  | hold
  | advance
  | retreat
deriving Repr, DecidableEq

def applyAction : Int → Action → Int
  | state, .hold => state
  | state, .advance => state + 1
  | state, .retreat => state - 1

def J21 : Int → Action → Int := applyAction

theorem hold_preserves_state (state : Int) :
    applyAction state .hold = state := by
  rfl

theorem advance_moves_one (state : Int) :
    applyAction state .advance = state + 1 := by
  rfl

theorem retreat_moves_one (state : Int) :
    applyAction state .retreat = state - 1 := by
  rfl

theorem action_execution_is_bounded (state : Int) (action : Action) :
    applyAction state action = state ∨
    applyAction state action = state + 1 ∨
    applyAction state action = state - 1 := by
  cases action <;> simp [applyAction]

