import Std

/-! P74: ternary value and base-11 address rotate as one pair. -/

structure Cubit where
  address : Nat
  value : Int
deriving Repr

def rotate : List Cubit → List Cubit
  | [] => []
  | head :: tail => tail ++ [head]

def spine : List Cubit :=
  [ { address := 0, value := -1 }
  , { address := 1, value := 0 }
  , { address := 2, value := 1 } ]

def rotate3 : List Cubit := rotate (rotate (rotate spine))
def total (values : List Cubit) : Int := values.foldl (fun sum cubit => sum + cubit.value) 0

theorem paired_state_closes : rotate3 = spine := by rfl
theorem paired_state_preserves_balance : total rotate3 = total spine := by rfl
theorem paired_state_is_neutral : total rotate3 = 0 := by rfl
theorem addresses_remain_base11 : spine.all (fun cubit => cubit.address < 11) = true := by decide

#eval rotate3
#eval total rotate3
