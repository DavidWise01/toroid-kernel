/-!
Code Veronica N6: nourishment flow conservation.

The kernel can account for a simple intake-then-consumption sequence exactly.
-/

structure NourishmentStore where
  resource : Nat

def intake (store : NourishmentStore) (amount : Nat) : NourishmentStore :=
  { resource := store.resource + amount }

def consume (store : NourishmentStore) (amount : Nat) : NourishmentStore :=
  { resource := store.resource - amount }

def J_CodeVeronicaN6 : NourishmentStore → Nat → Nat → NourishmentStore :=
  fun store received used => consume (intake store received) used

theorem flow_is_conserved :
    (consume (intake { resource := 4 } 3) 2).resource = 5 := by
  rfl

theorem full_consumption_reaches_zero :
    (consume (intake { resource := 4 } 3) 7).resource = 0 := by
  rfl

theorem zero_flow_preserves_store :
    (consume (intake { resource := 4 } 0) 0).resource = 4 := by
  rfl
