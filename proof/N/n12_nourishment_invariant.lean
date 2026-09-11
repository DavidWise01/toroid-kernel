/-!
Code Veronica N12: final nourishment invariant.

The nourishment state is valid exactly when its resource remains between the
reserve floor and capacity ceiling.
-/

structure NourishmentStore where
  resource : Nat
  reserve : Nat
  capacity : Nat

def NourishmentInvariant (store : NourishmentStore) : Prop :=
  store.reserve ≤ store.resource ∧ store.resource ≤ store.capacity

def J_CodeVeronicaN12 : NourishmentStore → Prop := NourishmentInvariant

theorem nourishment_accepts_safe_state :
    NourishmentInvariant { resource := 5, reserve := 3, capacity := 10 } := by
  constructor <;> decide

theorem nourishment_rejects_below_reserve :
    ¬ NourishmentInvariant { resource := 2, reserve := 3, capacity := 10 } := by
  intro h
  decide at h

theorem nourishment_rejects_above_capacity :
    ¬ NourishmentInvariant { resource := 11, reserve := 3, capacity := 10 } := by
  intro h
  decide at h

theorem code_veronica_n_is_closed :
    NourishmentInvariant { resource := 5, reserve := 3, capacity := 10 } := by
  exact nourishment_accepts_safe_state
