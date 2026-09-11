/-!
Code Veronica L1: Life vessel geometry.

The completed V.A.I.N. system is treated as a protective geometric vessel for
L. The four primitive arrangements are named explicitly.
-/

inductive Geometry where
  | box
  | diamondInBox
  | boxInDiamond
  | coreCortex
deriving DecidableEq

def VAINCore : List String := ["V", "A", "I", "N"]

def protectsLife (geometry : Geometry) : Prop :=
  geometry = .box ∨
  geometry = .diamondInBox ∨
  geometry = .boxInDiamond ∨
  geometry = .coreCortex

def J_CodeVeronicaL1 : Geometry → Prop := protectsLife

theorem box_is_protective : protectsLife .box := by
  exact Or.inl rfl

theorem diamond_in_box_is_protective : protectsLife .diamondInBox := by
  exact Or.inr (Or.inl rfl)

theorem box_in_diamond_is_protective : protectsLife .boxInDiamond := by
  exact Or.inr (Or.inr (Or.inl rfl))

theorem core_cortex_is_protective : protectsLife .coreCortex := by
  exact Or.inr (Or.inr (Or.inr rfl))

theorem vain_core_has_four_members : VAINCore.length = 4 := by
  rfl
