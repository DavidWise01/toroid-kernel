/-!
MFC4: charge/discharge round-trip accounting.

The capacitor applies an intake and then a controlled discharge. The remaining
stored charge is computed exactly.
-/

structure Capacitor where
  capacity : Nat
  stored : Nat

def fill (capacitor : Capacitor) (input : Nat) : Capacitor :=
  { capacity := capacitor.capacity
    stored := if capacitor.capacity < capacitor.stored + input
              then capacitor.capacity else capacitor.stored + input }

def discharge (capacitor : Capacitor) (requested : Nat) : Capacitor :=
  { capacity := capacitor.capacity
    stored := capacitor.stored - requested }

def J_MFC4 : Capacitor → Nat → Nat → Capacitor :=
  fun capacitor input requested => discharge (fill capacitor input) requested

theorem round_trip_remaining_charge :
    (discharge (fill { capacity := 25, stored := 20 } 10) 7).stored = 18 := by
  rfl

theorem round_trip_from_empty :
    (discharge (fill { capacity := 25, stored := 0 } 10) 4).stored = 6 := by
  rfl

theorem round_trip_cannot_exceed_capacity :
    (fill { capacity := 25, stored := 20 } 10).stored = 25 := by
  rfl
