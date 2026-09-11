/-!
MFC3: controlled capacitor discharge.

Discharge releases stored charge up to the requested amount. The capacitor
never reports negative stored charge.
-/

structure Capacitor where
  capacity : Nat
  stored : Nat

def discharge (capacitor : Capacitor) (requested : Nat) : Capacitor × Nat :=
  if capacitor.stored ≤ requested then
    ({ capacity := capacitor.capacity, stored := 0 }, capacitor.stored)
  else
    ({ capacity := capacitor.capacity, stored := capacitor.stored - requested }, requested)

def J_MFC3 : Capacitor → Nat → Capacitor × Nat := discharge

theorem partial_discharge :
    (discharge { capacity := 25, stored := 20 } 5).1.stored = 15 := by
  rfl

theorem partial_discharge_output :
    (discharge { capacity := 25, stored := 20 } 5).2 = 5 := by
  rfl

theorem full_discharge_reaches_zero :
    (discharge { capacity := 25, stored := 20 } 20).1.stored = 0 := by
  rfl

theorem over_discharge_is_capped :
    (discharge { capacity := 25, stored := 20 } 30).2 = 20 := by
  rfl
