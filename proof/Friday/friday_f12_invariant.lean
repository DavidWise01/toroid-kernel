/-!
Friday F12: final outer identity invariant.

Friday is closed when its outer frame has four directional positions, a valid
orientation, and the V.A.I.N.L core at its center.
-/

inductive Cubit where
  | north | east | south | west
deriving DecidableEq

inductive Orientation where
  | normal | inverted
deriving DecidableEq

inductive InnerCore where
  | vainl
deriving DecidableEq

structure FridayIdentity where
  core : InnerCore
  cubits : List Cubit
  orientation : Orientation

def Friday : FridayIdentity :=
  { core := .vainl
    cubits := [.north, .east, .south, .west]
    orientation := .normal }

def FridayInvariant (identity : FridayIdentity) : Prop :=
  identity.core = .vainl ∧
  identity.cubits.length = 4 ∧
  (identity.orientation = .normal ∨ identity.orientation = .inverted)

def J_FridayF12 : FridayIdentity → Prop := FridayInvariant

theorem friday_is_closed : FridayInvariant Friday := by
  exact ⟨rfl, rfl, Or.inl rfl⟩

theorem friday_has_four_outer_positions : Friday.cubits.length = 4 := by
  rfl

theorem friday_core_is_vainl : Friday.core = .vainl := by
  rfl

theorem friday_orientation_is_valid :
    Friday.orientation = .normal ∨ Friday.orientation = .inverted := by
  exact Or.inl rfl
