/-!
Code Veronica I7: bounded response.

The intellect applies a one-unit nudge: raise adds one, hold changes nothing,
and lower subtracts one.
-/

inductive Response where
  | raise | hold | lower
deriving DecidableEq

def applyResponse (response : Response) (value : Int) : Int :=
  match response with
  | .raise => value + 1
  | .hold => value
  | .lower => value - 1

def J_CodeVeronicaI7 : Response → Int → Int := applyResponse

theorem raise_is_one_step : applyResponse .raise 10 = 11 := by
  rfl

theorem hold_is_zero_step : applyResponse .hold 10 = 10 := by
  rfl

theorem lower_is_one_step : applyResponse .lower 10 = 9 := by
  rfl
