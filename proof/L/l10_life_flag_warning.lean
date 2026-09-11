/-!
Code Veronica L10: flag warning and paired movement.

Two units may move together. A warning marker records possible opposition
behind the contacted flag, so a lone unit is not cleared to advance.
-/

structure MovementState where
  units : Nat
  flagPlanted : Bool
  rearWarning : Bool

def mayAdvance (state : MovementState) : Prop :=
  state.units ≥ 2 ∧ state.flagPlanted = true ∧ state.rearWarning = false

def J_CodeVeronicaL10 : MovementState → Prop := mayAdvance

theorem paired_clear_movement_is_allowed :
    mayAdvance { units := 2, flagPlanted := true, rearWarning := false } := by
  constructor
  · decide
  constructor <;> rfl

theorem rear_warning_blocks_movement :
    ¬ mayAdvance { units := 2, flagPlanted := true, rearWarning := true } := by
  intro h
  cases h.2.2

theorem lone_unit_is_not_cleared :
    ¬ mayAdvance { units := 1, flagPlanted := true, rearWarning := false } := by
  intro h
  decide at h

theorem planted_flag_is_recorded :
    ({ units := 2, flagPlanted := true, rearWarning := true } : MovementState).flagPlanted = true := by
  rfl
