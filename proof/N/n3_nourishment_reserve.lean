/-!
Code Veronica N3: reserve protection.

The store keeps a protected reserve. Consumption may use only the resource
above that reserve.
-/

structure NourishmentStore where
  resource : Nat

def safeConsume (store : NourishmentStore) (reserve amount : Nat) : NourishmentStore :=
  { resource := (store.resource - reserve) - amount + reserve }

def J_CodeVeronicaN3 : NourishmentStore → Nat → Nat → NourishmentStore :=
  fun store reserve amount => safeConsume store reserve amount

theorem consume_above_reserve :
    (safeConsume { resource := 10 } 3 4).resource = 6 := by
  rfl

theorem consume_to_reserve :
    (safeConsume { resource := 10 } 3 7).resource = 3 := by
  rfl

theorem consume_past_reserve_is_protected :
    (safeConsume { resource := 10 } 3 20).resource = 3 := by
  rfl
