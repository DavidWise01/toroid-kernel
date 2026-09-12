import Std

/-! P71: the sentinel pair and analytical center sum to neutral. -/

def leftValue : Int := -1
def centerValue : Int := 0
def rightValue : Int := 1
def spineBalance : Int := leftValue + centerValue + rightValue

theorem spine_is_neutral : spineBalance = 0 := by
  norm_num [spineBalance, leftValue, centerValue, rightValue]

theorem sentinels_cancel : leftValue + rightValue = 0 := by
  norm_num [leftValue, rightValue]

theorem analytical_center_is_zero : centerValue = 0 := by rfl

#eval spineBalance
