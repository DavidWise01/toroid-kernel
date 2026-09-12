import Std

/-! P69: combined ternary-role and base-11-address spine. -/

inductive Position where | left | center | right deriving DecidableEq, Repr
inductive Role where | sentinelNeg | analytical | sentinelPos deriving DecidableEq, Repr

def roleOf : Position → Role
  | .left => .sentinelNeg | .center => .analytical | .right => .sentinelPos
def addressOf : Position → Nat
  | .left => 0 | .center => 1 | .right => 2
def nextPosition : Position → Position
  | .left => .center | .center => .right | .right => .left

def spineInvariant : Prop :=
  roleOf .left = .sentinelNeg ∧ roleOf .center = .analytical ∧ roleOf .right = .sentinelPos ∧
  addressOf .left = 0 ∧ addressOf .center = 1 ∧ addressOf .right = 2 ∧ addressOf (nextPosition .right) = 0

theorem role_address_spine : spineInvariant := by
  simp [spineInvariant, roleOf, addressOf, nextPosition]

theorem center_is_unique_analytical : roleOf .center = .analytical ∧ roleOf .left ≠ .analytical ∧ roleOf .right ≠ .analytical := by decide

theorem right_address_wraps_to_left : addressOf (nextPosition .right) = addressOf .left := by rfl

#eval [Position.left, Position.center, Position.right].map addressOf
