/-!
Code Veronica N2: controlled consumption.

Consumption is capped by the stored resource. The store never represents a
negative amount.
-/

structure NourishmentStore where
  resource : Nat

def consume (store : NourishmentStore) (amount : Nat) : NourishmentStore :=
  { resource := store.resource - amount }

def J_CodeVeronicaN2 : NourishmentStore → Nat → NourishmentStore := consume

theorem consume_available_resource :
    (consume { resource := 5 } 2).resource = 3 := by
  rfl

theorem consume_all_resource :
    (consume { resource := 5 } 5).resource = 0 := by
  rfl

theorem consume_more_than_available_is_safe :
    (consume { resource := 2 } 5).resource = 0 := by
  rfl
