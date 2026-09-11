/-!
Friday F5: shell-to-core composition.

The outer shell arrangements are attached to the V.A.I.N.L inner identity.
-/

inductive Shell where
  | box
  | diamond
deriving DecidableEq

inductive InnerCore where
  | vainl
deriving DecidableEq

structure FridayCell where
  outerShell : Shell
  innerShell : Shell
  core : InnerCore

def FridayDiamondBox : FridayCell :=
  { outerShell := .box, innerShell := .diamond, core := .vainl }

def FridayBoxDiamond : FridayCell :=
  { outerShell := .diamond, innerShell := .box, core := .vainl }

def J_FridayF5 : FridayCell := FridayDiamondBox

theorem diamond_box_contains_vainl :
    FridayDiamondBox.core = .vainl := by
  rfl

theorem box_diamond_contains_vainl :
    FridayBoxDiamond.core = .vainl := by
  rfl

theorem friday_cell_has_outer_box : FridayDiamondBox.outerShell = .box := by
  rfl

theorem friday_cell_has_inner_diamond : FridayDiamondBox.innerShell = .diamond := by
  rfl
