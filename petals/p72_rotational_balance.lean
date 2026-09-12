import Std

/-! P72: rotating the ternary spine preserves neutral balance. -/

def leftValue : Int := -1
def centerValue : Int := 0
def rightValue : Int := 1
def balance (a b c : Int) : Int := a + b + c

def rotation0 : Int := balance leftValue centerValue rightValue
def rotation1 : Int := balance centerValue rightValue leftValue
def rotation2 : Int := balance rightValue leftValue centerValue

theorem rotation0_neutral : rotation0 = 0 := by rfl
theorem rotation1_neutral : rotation1 = 0 := by rfl
theorem rotation2_neutral : rotation2 = 0 := by rfl

theorem every_rotation_is_neutral : rotation0 = 0 ∧ rotation1 = 0 ∧ rotation2 = 0 := by rfl

#eval [rotation0, rotation1, rotation2]
