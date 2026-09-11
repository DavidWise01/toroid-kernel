/-!
Friday: four logical cubits around an Analytical Cubi.

The scale expression is retained exactly as metadata: base 5 and exponent
((33 / 10)^3), representing 5^((3.3)^3) without floating-point rounding.
-/

inductive CubitPosition where
  | north
  | east
  | south
  | west
deriving DecidableEq

def LogicalCubits : List CubitPosition :=
  [.north, .east, .south, .west]

structure AnalyticalCubi where
  base : Nat
  exponentNumerator : Nat
  exponentDenominator : Nat
  exponentPower : Nat

def Friday : AnalyticalCubi :=
  { base := 5
    exponentNumerator := 33
    exponentDenominator := 10
    exponentPower := 3 }

def J_Friday : AnalyticalCubi := Friday

theorem friday_has_four_logical_cubits : LogicalCubits.length = 4 := by
  rfl

theorem friday_base_is_five : Friday.base = 5 := by
  rfl

theorem friday_exponent_is_three_point_three :
    Friday.exponentNumerator = 33 ∧ Friday.exponentDenominator = 10 := by
  exact ⟨rfl, rfl⟩

theorem friday_exponent_power_is_three : Friday.exponentPower = 3 := by
  rfl

theorem friday_has_analytical_cubi_center :
    Friday =
      { base := 5, exponentNumerator := 33,
        exponentDenominator := 10, exponentPower := 3 } := by
  rfl
