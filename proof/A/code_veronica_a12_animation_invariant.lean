/-!
Code Veronica A12: final animation invariant.

Every animation state remains on the three-frame ring after a forward step.
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

def AnimationInvariant (state : AnimationState) : Prop :=
  state.frame = .frame0 ∨ state.frame = .frame1 ∨ state.frame = .frame2

def J_CodeVeronicaA12 : AnimationState → Prop := AnimationInvariant

theorem every_state_is_on_ring (state : AnimationState) :
    AnimationInvariant state := by
  cases state with
  | mk frame cycles =>
    cases frame <;> simp [AnimationInvariant]

theorem advance_preserves_animation_invariant (state : AnimationState)
    (h : AnimationInvariant state) :
    AnimationInvariant (advance state) := by
  cases state with
  | mk frame cycles =>
    cases frame <;> simp [advance, AnimationInvariant]

theorem code_veronica_a_is_closed :
    AnimationInvariant { frame := .frame0, cycles := 0 } := by
  exact Or.inl rfl
