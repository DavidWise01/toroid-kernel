/-!
MFC2: staged capacitor filling.

Charge may arrive in multiple passes. Existing stored charge is preserved and
the finite capacity remains the upper bound.
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

def J_MFC2 : Capacitor → Nat → Capacitor × Nat := fill

def start : Capacitor := { capacity := 25, stored := 5 }

def firstPass : Capacitor × Nat := fill start 10
def secondPass : Capacitor × Nat := fill firstPass.1 15

theorem first_pass_preserves_charge : firstPass.1.stored = 15 := by
  rfl

theorem first_pass_has_no_overflow : firstPass.2 = 0 := by
  rfl

theorem second_pass_reaches_capacity : secondPass.1.stored = 25 := by
  rfl

theorem second_pass_overflow_is_zero : secondPass.2 = 5 := by
  rfl
