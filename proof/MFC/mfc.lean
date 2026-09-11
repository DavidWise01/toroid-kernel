/-!
MFC: Model Fill Capacitor.

This is the finite, machine-checkable core of the capacitor visualization.
Infinity is not used as a numeric value. Capacity, storage, overflow, and
conservation are explicit.
-/

structure Capacitor where
  capacity : Nat
  stored : Nat

def fill (capacitor : Capacitor) (input : Nat) : Capacitor × Nat :=
  if capacitor.capacity ≤ capacitor.stored + input then
    ({ capacity := capacitor.capacity, stored := capacitor.capacity },
      capacitor.stored + input - capacitor.capacity)
  else
    ({ capacity := capacitor.capacity, stored := capacitor.stored + input }, 0)

def MFCWidth : Nat := 5
def MFCHeight : Nat := 5
def MFCCapacity : Nat := MFCWidth * MFCHeight

def MFC : Capacitor := { capacity := MFCCapacity, stored := 0 }

def FlowNumerator : Nat := 196
def FlowDenominator : Nat := 1000

def J_MFC : Capacitor → Nat → Capacitor × Nat := fill

theorem mfc_capacity_is_twenty_five : MFCCapacity = 25 := by
  rfl

theorem mfc_fills_to_capacity :
    (fill MFC 25).1.stored = 25 := by
  rfl

theorem mfc_clamps_excess :
    (fill MFC 100).1.stored = 25 := by
  rfl

theorem mfc_records_excess_as_overflow :
    (fill MFC 100).2 = 75 := by
  rfl

theorem mfc_conserves_input :
    (fill MFC 100).1.stored + (fill MFC 100).2 = 100 := by
  rfl

theorem mfc_flow_is_exactly_scaled :
    FlowNumerator = 196 ∧ FlowDenominator = 1000 := by
  exact ⟨rfl, rfl⟩
