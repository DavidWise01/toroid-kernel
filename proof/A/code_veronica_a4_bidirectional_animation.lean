/-!
Code Veronica A4: bidirectional animation.

The frame ring supports forward and backward motion, with wraparound at both
ends.
-/

inductive AnimationFrame where
  | frame0 | frame1 | frame2
deriving DecidableEq

inductive AnimationDirection where
  | forward | backward
deriving DecidableEq

def stepForward : AnimationFrame → AnimationFrame
  | .frame0 => .frame1
  | .frame1 => .frame2
  | .frame2 => .frame0

def stepBackward : AnimationFrame → AnimationFrame
  | .frame0 => .frame2
  | .frame1 => .frame0
  | .frame2 => .frame1

def step (direction : AnimationDirection) (frame : AnimationFrame) : AnimationFrame :=
  match direction with
  | .forward => stepForward frame
  | .backward => stepBackward frame

def J_CodeVeronicaA4 : AnimationDirection → AnimationFrame → AnimationFrame := step

theorem forward_wraps : step .forward .frame2 = .frame0 := by
  rfl

theorem backward_wraps : step .backward .frame0 = .frame2 := by
  rfl

theorem forward_then_backward_returns :
    step .backward (step .forward .frame1) = .frame1 := by
  rfl
