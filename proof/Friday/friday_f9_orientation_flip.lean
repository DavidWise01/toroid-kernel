/-!
Friday F9: outer orientation flip.

The shell orientation may be normal or inverted. Flipping twice returns to the
original orientation; the inner identity is unaffected.
-/

inductive Orientation where
  | normal
  | inverted
deriving DecidableEq

inductive InnerCore where
  | vainl
deriving DecidableEq

structure FridayOrientation where
  core : InnerCore
  orientation : Orientation

def flip : Orientation → Orientation
  | .normal => .inverted
  | .inverted => .normal

def flipFriday (state : FridayOrientation) : FridayOrientation :=
  { core := state.core, orientation := flip state.orientation }

def J_FridayF9 : FridayOrientation → FridayOrientation := flipFriday

theorem normal_flips_to_inverted : flip .normal = .inverted := by
  rfl

theorem inverted_flips_to_normal : flip .inverted = .normal := by
  rfl

theorem double_flip_restores_orientation (orientation : Orientation) :
    flip (flip orientation) = orientation := by
  cases orientation <;> rfl

theorem flip_preserves_inner_core (state : FridayOrientation) :
    (flipFriday state).core = state.core := by
  rfl
