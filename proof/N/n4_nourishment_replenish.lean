/-!
Code Veronica N4: replenishment to target.

Low nourishment is restored to a target level. Existing nourishment is never
discarded by replenishment.
-/

structure NourishmentStore where
  resource : Nat

def replenishTo (store : NourishmentStore) (target : Nat) : NourishmentStore :=
  if store.resource < target then { resource := target } else store

def J_CodeVeronicaN4 : NourishmentStore → Nat → NourishmentStore := replenishTo

theorem low_store_reaches_target :
    (replenishTo { resource := 2 } 5).resource = 5 := by
  rfl

theorem target_store_is_unchanged :
    (replenishTo { resource := 5 } 5).resource = 5 := by
  rfl

theorem surplus_store_is_unchanged :
    (replenishTo { resource := 7 } 5).resource = 7 := by
  rfl
