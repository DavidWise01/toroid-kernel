/-!
Code Veronica A5: pause and resume.

Pausing preserves the current frame. Resuming restores motion from that frame.
-/

inductive AnimationFrame where
  | frame0 | frame1 | frame2
deriving DecidableEq

structure AnimationState where
  frame : AnimationFrame
  running : Bool

def nextFrame : AnimationFrame → AnimationFrame
  | .frame0 => .frame1
  | .frame1 => .frame2
  | .frame2 => .frame0

def tick (state : AnimationState) : AnimationState :=
  if state.running then
    { frame := nextFrame state.frame, running := true }
  else
    state

def J_CodeVeronicaA5 : AnimationState → AnimationState := tick

theorem paused_state_is_preserved (frame : AnimationFrame) :
    tick { frame := frame, running := false } = { frame := frame, running := false } := by
  simp [tick]

theorem resume_advances_frame :
    tick { frame := .frame0, running := true } = { frame := .frame1, running := true } := by
  rfl

theorem paused_frame_is_not_lost :
    (tick { frame := .frame2, running := false }).frame = .frame2 := by
  rfl
