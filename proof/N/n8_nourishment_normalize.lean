/-!
Code Veronica N8: nourishment normalization.

Normalization repairs an out-of-band resource value by clamping it to the
reserve floor or capacity ceiling.
-/

structure NourishmentStore where
  resource : Nat
  reserve : Nat
  capacity : Nat

def normalize (store : NourishmentStore) : NourishmentStore :=
  { resource :=
      if store.resource < store.reserve then store.reserve
      else if store.capacity < store.resource then store.capacity
      else store.resource
    reserve := store.reserve
    capacity := store.capacity }

def J_CodeVeronicaN8 : NourishmentStore → NourishmentStore := normalize

theorem normalize_low_value :
    (normalize { resource := 2, reserve := 3, capacity := 10 }).resource = 3 := by
  rfl

theorem normalize_high_value :
    (normalize { resource := 12, reserve := 3, capacity := 10 }).resource = 10 := by
  rfl

theorem normalize_valid_value :
    (normalize { resource := 5, reserve := 3, capacity := 10 }).resource = 5 := by
  rfl
