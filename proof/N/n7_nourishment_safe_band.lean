/-!
Code Veronica N7: nourishment safe band.

The stored resource is valid when it lies between its reserve floor and its
capacity ceiling.
-/

structure NourishmentStore where
  resource : Nat
  reserve : Nat
  capacity : Nat

def NourishmentInvariant (store : NourishmentStore) : Prop :=
  store.reserve ≤ store.resource ∧ store.resource ≤ store.capacity

def J_CodeVeronicaN7 : NourishmentStore → Prop := NourishmentInvariant

theorem resource_inside_safe_band :
    NourishmentInvariant { resource := 5, reserve := 3, capacity := 10 } := by
  constructor <;> decide

theorem resource_at_reserve_is_valid :
    NourishmentInvariant { resource := 3, reserve := 3, capacity := 10 } := by
  constructor <;> decide

theorem resource_at_capacity_is_valid :
    NourishmentInvariant { resource := 10, reserve := 3, capacity := 10 } := by
  constructor <;> decide

theorem resource_below_reserve_is_invalid :
    ¬ NourishmentInvariant { resource := 2, reserve := 3, capacity := 10 } := by
  intro h
  decide at h
