import Std

/-! P68 v2: the three-position torus cycle inside base-11 addresses. -/

def nextAddress (address : Nat) : Nat := if address < 2 then address + 1 else 0
def addressOrbit : Nat → Nat := nextAddress ∘ nextAddress ∘ nextAddress
def inBase11 (address : Nat) : Prop := address < 11

theorem address_cycle : nextAddress 0 = 1 ∧ nextAddress 1 = 2 ∧ nextAddress 2 = 0 := by decide

theorem address_three_step_return : addressOrbit 0 = 0 ∧ addressOrbit 1 = 1 ∧ addressOrbit 2 = 2 := by
  simp [addressOrbit, Function.comp_def, nextAddress]

theorem spine_addresses_fit_base11 : inBase11 0 ∧ inBase11 1 ∧ inBase11 2 := by
  simp [inBase11]

#eval [0, 1, 2].map addressOrbit
