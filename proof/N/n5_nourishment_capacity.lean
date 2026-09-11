/-!
Code Veronica N5: capacity protection.

Intake is capped at the store's maximum capacity. Nourishment remains bounded
on both sides: reserve below, capacity above.
-/

structure NourishmentStore where
  resource : Nat
  capacity : Nat

def cappedIntake (store : NourishmentStore) (amount : Nat) : NourishmentStore :=
  { resource := if store.capacity < store.resource + amount
                then store.capacity else store.resource + amount
    capacity := store.capacity }

def J_CodeVeronicaN5 : NourishmentStore → Nat → NourishmentStore := cappedIntake

theorem intake_below_capacity :
    (cappedIntake { resource := 2, capacity := 10 } 3).resource = 5 := by
  rfl

theorem intake_at_capacity_clamps :
    (cappedIntake { resource := 8, capacity := 10 } 5).resource = 10 := by
  rfl

theorem full_store_stays_full :
    (cappedIntake { resource := 10, capacity := 10 } 5).resource = 10 := by
  rfl
