/-!
MFC6: balanced four-cell bank.

The four directional cells carry equal stored charge. This is the first bank
level homeostasis rule.
-/

structure Bank where
  north : Nat
  east : Nat
  south : Nat
  west : Nat

def BalancedBank : Bank :=
  { north := 5, east := 5, south := 5, west := 5 }

def balanced (bank : Bank) : Prop :=
  bank.north = bank.east ∧
  bank.east = bank.south ∧
  bank.south = bank.west

def J_MFC6 : Bank → Prop := balanced

theorem bank_is_balanced : balanced BalancedBank := by
  exact ⟨rfl, rfl, rfl⟩

theorem north_equals_south : BalancedBank.north = BalancedBank.south := by
  rfl

theorem east_equals_west : BalancedBank.east = BalancedBank.west := by
  rfl
