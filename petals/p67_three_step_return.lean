import Std

/-! P67: three transitions return every spine position to itself. -/

inductive Position where
  | left
  | center
  | right
deriving DecidableEq, Repr

def nextPosition : Position → Position
  | .left => .center
  | .center => .right
  | .right => .left

def orbit : Position → Position := nextPosition ∘ nextPosition ∘ nextPosition

theorem left_returns : orbit .left = .left := by rfl
theorem center_returns : orbit .center = .center := by rfl
theorem right_returns : orbit .right = .right := by rfl

theorem full_three_step_return : orbit .left = .left ∧ orbit .center = .center ∧ orbit .right = .right := by
  simp [orbit, Function.comp_def, nextPosition]

#eval [Position.left, Position.center, Position.right].map orbit
