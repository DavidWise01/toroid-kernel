/-!
Code Veronica A9: deterministic reset.

Reset returns the animation to its canonical origin: frame zero, cycle zero.
-/

inductive AnimationFrame where
  | frame0 | frame1 | frame2
deriving DecidableEq

structure AnimationState where
  frame : AnimationFrame
  cycles : Nat

def reset (_ : AnimationState) : AnimationState :=
  { frame := .frame0, cycles := 0 }

def J_CodeVeronicaA9 : AnimationState → AnimationState := reset

theorem reset_frame_is_zero (state : AnimationState) :
    (reset state).frame = .frame0 := by
  rfl

theorem reset_cycle_count_is_zero (state : AnimationState) :
    (reset state).cycles = 0 := by
  rfl

theorem reset_is_idempotent (state : AnimationState) :
    reset (reset state) = reset state := by
  rfl
