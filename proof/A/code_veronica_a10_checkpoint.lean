/-!
Code Veronica A10: animation checkpoint and restore.

A checkpoint stores the complete animation state. Restoring it reproduces the
same frame and cycle count exactly.
-/

inductive AnimationFrame where
  | frame0 | frame1 | frame2
deriving DecidableEq

structure AnimationState where
  frame : AnimationFrame
  cycles : Nat

def checkpoint (state : AnimationState) : AnimationState := state

def restore (saved : AnimationState) : AnimationState := saved

def J_CodeVeronicaA10 : AnimationState → AnimationState := checkpoint

theorem checkpoint_preserves_frame (state : AnimationState) :
    (checkpoint state).frame = state.frame := by
  rfl

theorem checkpoint_preserves_cycles (state : AnimationState) :
    (checkpoint state).cycles = state.cycles := by
  rfl

theorem restore_returns_exact_state (state : AnimationState) :
    restore (checkpoint state) = state := by
  rfl
