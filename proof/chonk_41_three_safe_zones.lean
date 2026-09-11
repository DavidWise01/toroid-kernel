/-!
Chonk 41: three equally spaced vessel safe zones.

The zones are centered on the homeostatic anchor and fit inside one total
plus/minus 5 percent envelope: inner 0%, middle 2.5%, outer 5%.
-/

inductive SafeZone where
  | inner
  | middle
  | outer
deriving Repr, DecidableEq

def zoneRadiusBasisPoints : SafeZone → Nat
  | .inner => 0
  | .middle => 250
  | .outer => 500

def inZone (zone : SafeZone) (anchor sample : Int) : Prop :=
  Int.natAbs (sample - anchor) ≤ zoneRadiusBasisPoints zone

def J41 : SafeZone → Int → Int → Prop := inZone

theorem inner_zone_is_exact_anchor (anchor : Int) :
    inZone .inner anchor anchor := by
  decide

theorem middle_zone_accepts_25_percent_units :
    inZone .middle 10000 10250 := by
  decide

theorem outer_zone_accepts_5_percent_units :
    inZone .outer 10000 10500 := by
  decide

theorem outside_outer_zone_rejected :
    ¬ inZone .outer 10000 10501 := by
  decide

