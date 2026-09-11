/-!
Chonk 29: numbered cortex checkpoints.

Each accepted state carries a cycle number. A checkpoint is continuous when
its cycle is exactly one after its predecessor.
-/

structure Checkpoint where
  previousCycle : Nat
  cycle : Nat
  state : Int

def continuousCheckpoint (c : Checkpoint) : Prop :=
  c.cycle = c.previousCycle + 1

def J29 : Checkpoint → Prop := continuousCheckpoint

theorem first_checkpoint_is_continuous (state : Int) :
    continuousCheckpoint { previousCycle := 0, cycle := 1, state := state } := by
  rfl

theorem next_checkpoint_is_continuous (previous : Nat) (state : Int) :
    continuousCheckpoint
      { previousCycle := previous, cycle := previous + 1, state := state } := by
  rfl

theorem gap_is_not_continuous (previous cycle : Nat) (h : cycle ≠ previous + 1)
    (state : Int) :
    ¬ continuousCheckpoint { previousCycle := previous, cycle := cycle, state := state } := by
  intro hc
  exact h hc

