import Std

/-! P66: the ternary spine wraps from R back to L. -/

inductive Position where
  | left
  | center
  | right
deriving DecidableEq, Repr

def nextPosition : Position → Position
  | .left => .center
  | .center => .right
  | .right => .left

def roleOf : Position → String
  | .left => "sentinel−"
  | .center => "analytical"
  | .right => "sentinel+"

def spineCycle : List Position := [.left, .center, .right]

def cycleInvariant : Prop :=
  spineCycle.length = 3 ∧ nextPosition .left = .center ∧
  nextPosition .center = .right ∧ nextPosition .right = .left ∧
  roleOf .center = "analytical"

theorem spine_wraps : cycleInvariant := by
  simp [cycleInvariant, spineCycle, nextPosition, roleOf]

theorem right_wraps_to_left : nextPosition .right = .left := by rfl

theorem center_remains_analytical : roleOf .center = "analytical" := by rfl

#eval spineCycle.map nextPosition
