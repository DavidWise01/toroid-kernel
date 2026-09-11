/-!
Chonk 31: one committed cortex cycle.

The cycle is admitted only when the action is witnessed and the sequence is
continuous. The state transition itself remains bounded to one step.
-/

inductive Action where
  | hold
  | advance
  | retreat
deriving Repr, DecidableEq

structure CortexCycle where
  before : Int
  after : Int
  action : Action
  witnessed : Bool
  sequenceContinuous : Bool

def executeBounded (state : Int) : Action → Int
  | .hold => state
  | .advance => state + 1
  | .retreat => state - 1

def cycleAccepted (c : CortexCycle) : Bool :=
  c.witnessed && c.sequenceContinuous && c.after = executeBounded c.before c.action

def J31 : CortexCycle → Bool := cycleAccepted

theorem committed_hold_cycle :
    cycleAccepted
      { before := 1, after := 1, action := .hold,
        witnessed := true, sequenceContinuous := true } = true := by
  rfl

theorem committed_advance_cycle :
    cycleAccepted
      { before := 1, after := 2, action := .advance,
        witnessed := true, sequenceContinuous := true } = true := by
  rfl

theorem uncommitted_cycle_is_blocked :
    cycleAccepted
      { before := 1, after := 2, action := .advance,
        witnessed := false, sequenceContinuous := true } = false := by
  rfl

theorem wrong_state_transition_is_blocked :
    cycleAccepted
      { before := 1, after := 7, action := .advance,
        witnessed := true, sequenceContinuous := true } = false := by
  rfl

