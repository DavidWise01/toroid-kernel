import Std

/-! P65 v3: ternary roles carried by base-11 bounded addresses. -/

inductive Role where
  | sentinelNeg
  | analytical
  | sentinelPos
deriving DecidableEq, Repr

def roleValue : Role → Int
  | .sentinelNeg => -1
  | .analytical => 0
  | .sentinelPos => 1

structure Cubit where
  label : String
  role : Role
  address : Nat
deriving DecidableEq, Repr

def Spine : List Cubit :=
  [ { label := "L", role := .sentinelNeg, address := 0 }
  , { label := "1", role := .analytical, address := 1 }
  , { label := "R", role := .sentinelPos, address := 2 } ]

def addressInBase11 (address : Nat) : Bool := address < 11
def ternaryRole (role : Role) : Bool :=
  roleValue role == -1 || roleValue role == 0 || roleValue role == 1

def spineInvariant : Prop :=
  Spine.length = 3 ∧
  Spine[0]?.map (·.role) = some .sentinelNeg ∧
  Spine[1]?.map (·.role) = some .analytical ∧
  Spine[2]?.map (·.role) = some .sentinelPos ∧
  Spine.all (fun cubit => addressInBase11 cubit.address) = true ∧
  Spine.all (fun cubit => ternaryRole cubit.role) = true

theorem spine_is_ternary_base11 : spineInvariant := by
  simp [spineInvariant, Spine, addressInBase11, ternaryRole, roleValue]

theorem spine_role_values :
    roleValue .sentinelNeg = -1 ∧
    roleValue .analytical = 0 ∧
    roleValue .sentinelPos = 1 := by
  decide

theorem spine_addresses_are_bounded :
    Spine.all (fun cubit => cubit.address < 11) = true := by
  decide

#eval Spine
