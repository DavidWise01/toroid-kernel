/-!
Code Veronica N: complete Nourishment branch, N1 through N12.
-/

namespace CodeVeronicaN

structure Store where
  resource : Nat

def intake (store : Store) (amount : Nat) : Store :=
  { resource := store.resource + amount }

theorem N1_intake : (intake { resource := 2 } 3).resource = 5 := by rfl

def consume (store : Store) (amount : Nat) : Store :=
  { resource := store.resource - amount }

theorem N2_consume : (consume { resource := 5 } 2).resource = 3 := by rfl

def safeConsume (store : Store) (reserve amount : Nat) : Store :=
  { resource := (store.resource - reserve) - amount + reserve }

theorem N3_reserve : (safeConsume { resource := 10 } 3 20).resource = 3 := by rfl

def replenishTo (store : Store) (target : Nat) : Store :=
  if store.resource < target then { resource := target } else store

theorem N4_replenish : (replenishTo { resource := 2 } 5).resource = 5 := by rfl

structure CapacityStore where
  resource : Nat
  capacity : Nat

def cappedIntake (store : CapacityStore) (amount : Nat) : CapacityStore :=
  { resource := if store.capacity < store.resource + amount
                then store.capacity else store.resource + amount
    capacity := store.capacity }

theorem N5_capacity :
    (cappedIntake { resource := 8, capacity := 10 } 5).resource = 10 := by rfl

theorem N6_flow :
    (consume (intake { resource := 4 } 3) 2).resource = 5 := by rfl

structure BoundedStore where
  resource : Nat
  reserve : Nat
  capacity : Nat

def NourishmentInvariant (store : BoundedStore) : Prop :=
  store.reserve ≤ store.resource ∧ store.resource ≤ store.capacity

theorem N7_safe_band :
    NourishmentInvariant { resource := 5, reserve := 3, capacity := 10 } := by
  constructor <;> decide

def normalize (store : BoundedStore) : BoundedStore :=
  { resource :=
      if store.resource < store.reserve then store.reserve
      else if store.capacity < store.resource then store.capacity
      else store.resource
    reserve := store.reserve
    capacity := store.capacity }

theorem N8_normalize :
    (normalize { resource := 12, reserve := 3, capacity := 10 }).resource = 10 := by
  rfl

def bilateralBalanced (left right : Nat) : Prop :=
  left ≤ right + 1 ∧ right ≤ left + 1

theorem N9_bilateral : bilateralBalanced 5 6 := by
  constructor <;> decide

inductive NourishmentStatus where
  | reserve | usable | capacity
deriving DecidableEq

def statusOf (resource reserve capacity : Nat) : NourishmentStatus :=
  if resource ≤ reserve then .reserve
  else if capacity ≤ resource then .capacity else .usable

theorem N10_status : statusOf 5 3 10 = .usable := by rfl
theorem N11_boundary : statusOf 10 3 10 = .capacity := by rfl

theorem N12_closed :
    NourishmentInvariant { resource := 5, reserve := 3, capacity := 10 } := by
  constructor <;> decide

end CodeVeronicaN
