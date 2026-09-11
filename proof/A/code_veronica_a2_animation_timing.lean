/-!
Code Veronica A2: animation timing.

Each frame has a positive hold duration. Timing is kept separate from the
frame transition so the animation cannot advance through a zero-time frame.
-/

inductive AnimationFrame where
  | frame0 | frame1 | frame2
deriving DecidableEq

def frameDuration (_ : AnimationFrame) : Nat := 1

def J_CodeVeronicaA2 : AnimationFrame → Nat := frameDuration

theorem every_frame_has_positive_duration (frame : AnimationFrame) :
    0 < frameDuration frame := by
  rfl

theorem frame_zero_has_duration_one : frameDuration .frame0 = 1 := by
  rfl

theorem frame_one_has_duration_one : frameDuration .frame1 = 1 := by
  rfl

theorem frame_two_has_duration_one : frameDuration .frame2 = 1 := by
  rfl
