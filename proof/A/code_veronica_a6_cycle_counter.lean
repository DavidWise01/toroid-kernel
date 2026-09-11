/-!
Code Veronica A6: cycle accounting.

The animation records completed loops. The counter increases only when the
frame wraps from frame two back to frame zero.
-/

inductive AnimationFrame where
  | frame0 | frame1 | frame2
deriving DecidableEq

structure AnimationState where
  frame : AnimationFrame
  cycles : Nat

def advance (state : AnimationState) : AnimationState :=
  match state.frame with
  | .frame0 => { frame := .frame1, cycles := state.cycles }
  | .frame1 => { frame := .frame2, cycles := state.cycles }
  | .frame2 => { frame := .frame0, cycles := state.cycles + 1 }

def J_CodeVeronicaA6 : AnimationState → AnimationState := advance

theorem ordinary_step_keeps_cycle_count :
    advance { frame := .frame1, cycles := 4 } = { frame := .frame2, cycles := 4 } := by
  rfl

theorem wrap_increments_cycle_count :
    advance { frame := .frame2, cycles := 4 } = { frame := .frame0, cycles := 5 } := by
  rfl

theorem first_wrap_starts_at_zero :
    (advance { frame := .frame2, cycles := 0 }).frame = .frame0 := by
  rfl
