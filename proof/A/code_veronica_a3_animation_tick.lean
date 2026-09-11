/-!
Code Veronica A3: animation tick gate.

The frame changes only after its one-unit hold has completed.
-/

inductive AnimationFrame where
  | frame0 | frame1 | frame2
deriving DecidableEq

def nextFrame : AnimationFrame → AnimationFrame
  | .frame0 => .frame1
  | .frame1 => .frame2
  | .frame2 => .frame0

def tick (frame : AnimationFrame) (elapsed : Nat) : AnimationFrame :=
  if elapsed < 1 then frame else nextFrame frame

def J_CodeVeronicaA3 : AnimationFrame → Nat → AnimationFrame := tick

theorem tick_before_hold_keeps_frame (frame : AnimationFrame) :
    tick frame 0 = frame := by
  simp [tick]

theorem tick_after_hold_advances :
    tick .frame0 1 = .frame1 := by
  rfl

theorem tick_never_leaves_frame_set (frame : AnimationFrame) (elapsed : Nat) :
    tick frame elapsed = .frame0 ∨
    tick frame elapsed = .frame1 ∨
    tick frame elapsed = .frame2 := by
  cases frame <;> simp [tick, nextFrame]
