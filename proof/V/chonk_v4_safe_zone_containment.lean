/-!
V4: three nested vessel safe zones.

The inner, middle, and outer zones are ordered containment boundaries around
the 5 / 1 / 5 body.
-/

inductive SafeZone where
  | inner
  | middle
  | outer
deriving Repr, DecidableEq

def zoneRadius : SafeZone → Nat
  | .inner => 0
  | .middle => 250
  | .outer => 500

def bodyFits (bodyRadius : Nat) (zone : SafeZone) : Prop :=
  bodyRadius ≤ zoneRadius zone

def J_V4 : Nat → SafeZone → Prop := bodyFits

theorem zones_are_ordered :
    zoneRadius .inner ≤ zoneRadius .middle ∧
    zoneRadius .middle ≤ zoneRadius .outer := by
  decide

theorem inner_body_fits : bodyFits 0 .inner := by
  decide

theorem_body_fits_outer : bodyFits 11 .outer := by
  decide

theorem oversized_body_does_not_fit : ¬ bodyFits 501 .outer := by
  decide

