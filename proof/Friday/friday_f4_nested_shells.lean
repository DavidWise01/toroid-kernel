/-!
Friday F4: nested outer shells.

The outer identity uses the two primitive nesting arrangements: diamond inside
box and box inside diamond. Both are defined as shells around the inner core.
-/

inductive Shell where
  | box
  | diamond
deriving DecidableEq

structure NestedShell where
  outer : Shell
  inner : Shell

def diamondInBox : NestedShell :=
  { outer := .box, inner := .diamond }

def boxInDiamond : NestedShell :=
  { outer := .diamond, inner := .box }

def J_FridayF4 : NestedShell := diamondInBox

theorem diamond_is_inside_box :
    diamondInBox.outer = .box ∧ diamondInBox.inner = .diamond := by
  exact ⟨rfl, rfl⟩

theorem box_is_inside_diamond :
    boxInDiamond.outer = .diamond ∧ boxInDiamond.inner = .box := by
  exact ⟨rfl, rfl⟩

theorem nested_shells_are_distinct :
    diamondInBox ≠ boxInDiamond := by
  intro h
  cases h
