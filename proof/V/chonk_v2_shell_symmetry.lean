/-!
V2: left/right vessel symmetry.

The shells are equal in size but remain distinct objects with distinct side
labels. Symmetry does not erase bilateral identity.
-/

inductive Side where
  | left
  | right
deriving Repr, DecidableEq

structure Shell where
  side : Side
  radius : Nat

def mirrorShell (radius : Nat) : Shell × Shell :=
  ({ side := .left, radius := radius }, { side := .right, radius := radius })

def J_V2 (radius : Nat) : Shell × Shell := mirrorShell radius

theorem mirror_radii_match (radius : Nat) :
    (mirrorShell radius).1.radius = (mirrorShell radius).2.radius := by
  rfl

theorem mirror_keeps_left_label (radius : Nat) :
    (mirrorShell radius).1.side = .left := by
  rfl

theorem mirror_keeps_right_label (radius : Nat) :
    (mirrorShell radius).2.side = .right := by
  rfl

theorem mirrored_shells_are_distinct :
    (Side.left : Side) ≠ Side.right := by
  decide

