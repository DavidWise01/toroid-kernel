/-!
Code Veronica N1: nourishment intake.

The nourishment kernel stores a nonnegative resource amount. Intake adds the
received amount without changing the meaning of the stored resource.
-/

structure NourishmentStore where
  resource : Nat

def intake (store : NourishmentStore) (amount : Nat) : NourishmentStore :=
  { resource := store.resource + amount }

def J_CodeVeronicaN1 : NourishmentStore → Nat → NourishmentStore := intake

theorem intake_preserves_existing_resource (store : NourishmentStore) :
    (intake store 0).resource = store.resource := by
  simp [intake]

theorem intake_adds_resource :
    (intake { resource := 2 } 3).resource = 5 := by
  rfl

theorem fresh_store_can_receive_nourishment :
    (intake { resource := 0 } 1).resource = 1 := by
  rfl
