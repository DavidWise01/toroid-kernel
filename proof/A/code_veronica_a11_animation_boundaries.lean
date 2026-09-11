/-!
Code Veronica A11: animation boundary tests.

The ring, reverse ring, and pause behavior are checked at their boundaries.
-/

inductive AnimationFrame where
  | frame0 | frame1 | frame2
deriving DecidableEq

def forward : AnimationFrame → AnimationFrame
  | .frame0 => .frame1
  | .frame1 => .frame2
  | .frame2 => .frame0

def backward : AnimationFrame → AnimationFrame
  | .frame0 => .frame2
  | .frame1 => .frame0
  | .frame2 => .frame1

def hold (frame : AnimationFrame) (_ : Bool) : AnimationFrame := frame

def J_CodeVeronicaA11 : AnimationFrame → AnimationFrame := forward

theorem forward_boundary_wraps : forward .frame2 = .frame0 := by
  rfl

theorem backward_boundary_wraps : backward .frame0 = .frame2 := by
  rfl

theorem pause_boundary_holds : hold .frame1 false = .frame1 := by
  rfl
