import Std.Tactic

/-!
Chonk 14: 256 bounded torus positions plus one outside junction.

The outside node is a boundary transition, not a 257th bounded interior
position. The route wraps 255 -> outside -> 0.
-/

def torusBound : Nat := 256

inductive Torus256 where
  | bounded (position : Fin torusBound)
  | outside
deriving Repr, DecidableEq

def nextTorus : Torus256 → Torus256
  | .outside => .bounded ⟨0, by decide⟩
  | .bounded p =>
      if p.val = 255 then .outside
      else .bounded ⟨p.val + 1, by omega⟩

def J14 : Torus256 → Torus256 := nextTorus

def onePosition : Torus256 := .bounded ⟨1, by decide⟩

theorem torusBound_is_256 : torusBound = 256 := by
  rfl

theorem one_repeats : nextTorus onePosition = .bounded ⟨2, by decide⟩ := by
  rfl

theorem last_wraps_outside :
    nextTorus (.bounded ⟨255, by decide⟩) = .outside := by
  rfl

theorem outside_wraps_to_zero :
    nextTorus .outside = .bounded ⟨0, by decide⟩ := by
  rfl
