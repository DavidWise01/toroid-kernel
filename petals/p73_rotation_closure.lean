import Std

/-! P73: three rotations close the spine and preserve neutrality. -/

def leftValue : Int := -1
def centerValue : Int := 0
def rightValue : Int := 1

def rotate : List Int → List Int
  | [] => []
  | head :: tail => tail ++ [head]

def spine : List Int := [leftValue, centerValue, rightValue]
def rotate3 : List Int := rotate (rotate (rotate spine))
def total (values : List Int) : Int := values.foldl (· + ·) 0

theorem rotation_closes : rotate3 = spine := by rfl
theorem closed_spine_is_neutral : total rotate3 = 0 := by rfl
theorem original_spine_is_neutral : total spine = 0 := by rfl

#eval rotate3
#eval total rotate3
