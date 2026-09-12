import Std

/-! P70: ternary values and base-11 address bounds together. -/

inductive Position where | left | center | right deriving DecidableEq, Repr

def addressOf : Position → Nat
  | .left => 0 | .center => 1 | .right => 2

def roleValue : Position → Int
  | .left => -1 | .center => 0 | .right => 1

def base11Bound : Nat → Prop := fun address => address < 11

def boundedTernarySpine : Prop :=
  roleValue .left = -1 ∧ roleValue .center = 0 ∧ roleValue .right = 1 ∧
  base11Bound (addressOf .left) ∧ base11Bound (addressOf .center) ∧ base11Bound (addressOf .right)

theorem bounded_ternary_spine : boundedTernarySpine := by
  simp [boundedTernarySpine, roleValue, addressOf, base11Bound]

theorem role_values_are_distinct : roleValue .left ≠ roleValue .center ∧ roleValue .center ≠ roleValue .right ∧ roleValue .left ≠ roleValue .right := by decide

#eval [Position.left, Position.center, Position.right].map roleValue
