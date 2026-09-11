/-!
Code Veronica A1: animation frame cycle.

The first animation unit has three frames. The transition advances one frame
and wraps back to frame zero after the final frame.
-/

inductive AnimationFrame where
  | frame0 | frame1 | frame2
deriving DecidableEq

def nextFrame : AnimationFrame → AnimationFrame
  | .frame0 => .frame1
  | .frame1 => .frame2
  | .frame2 => .frame0

def J_CodeVeronicaA1 : AnimationFrame → AnimationFrame := nextFrame

theorem animation_advances_frame :
    nextFrame .frame0 = .frame1 ∧
    nextFrame .frame1 = .frame2 := by
  exact ⟨rfl, rfl⟩

theorem animation_wraps : nextFrame .frame2 = .frame0 := by
  rfl

theorem animation_three_steps_return :
    nextFrame (nextFrame (nextFrame .frame0)) = .frame0 := by
  rfl
