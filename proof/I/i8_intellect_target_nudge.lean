/-!
Code Veronica I8: target-directed nudge.

The intellect moves one unit toward a target and holds when the target is
already reached.
-/

def nudgeToward (value target : Int) : Int :=
  if value < target then value + 1
  else if target < value then value - 1
  else value

def J_CodeVeronicaI8 : Int → Int → Int := nudgeToward

theorem nudge_upward : nudgeToward 9 10 = 10 := by
  rfl

theorem nudge_downward : nudgeToward 11 10 = 10 := by
  rfl

theorem nudge_at_target_holds : nudgeToward 10 10 = 10 := by
  rfl

theorem nudge_does_not_jump_past_target :
    nudgeToward 9 10 ≤ 10 ∧ 10 ≤ nudgeToward 11 10 := by
  constructor <;> rfl
