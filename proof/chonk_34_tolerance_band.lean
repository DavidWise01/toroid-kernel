/-!
Chonk 34: exact ±2.5% tolerance band.

Percentages are represented as basis points: 2.5% = 250 / 10,000.
This chonk defines a normalized band around an anchor without using Float.
-/

def toleranceBasisPoints : Int := 250

def deviation (anchor sample : Int) : Nat :=
  Int.natAbs (sample - anchor)

def withinTolerance (anchor sample : Int) : Prop :=
  deviation anchor sample ≤ Int.toNat toleranceBasisPoints

def J34 : Int → Int → Prop := withinTolerance

theorem tolerance_is_250 : toleranceBasisPoints = 250 := by
  rfl

theorem anchor_is_within_band : withinTolerance 10000 10000 := by
  decide

theorem plus_250_is_within_band : withinTolerance 10000 10250 := by
  decide

theorem minus_250_is_within_band : withinTolerance 10000 9750 := by
  decide

theorem plus_251_is_outside_band : ¬ withinTolerance 10000 10251 := by
  decide

