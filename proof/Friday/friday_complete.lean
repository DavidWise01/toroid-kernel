/-!
Friday: complete outer identity, F1 through F12.

Friday is the outer identity around the completed V.A.I.N.L inner identity.
-/

namespace Friday

inductive Cubit where
  | north | east | south | west
deriving DecidableEq

def cubits : List Cubit := [.north, .east, .south, .west]

inductive Shell where
  | box | diamond
deriving DecidableEq

def shells : List Shell := [.box, .diamond]

inductive Orientation where
  | normal | inverted
deriving DecidableEq

inductive InnerCore where
  | vainl
deriving DecidableEq

structure Identity where
  core : InnerCore
  cubit : Cubit
  orientation : Orientation

def identity : Identity :=
  { core := .vainl, cubit := .north, orientation := .normal }

structure AnalyticalScale where
  base : Nat
  exponentNumerator : Nat
  exponentDenominator : Nat
  exponentPower : Nat

def scale : AnalyticalScale :=
  { base := 5, exponentNumerator := 33,
    exponentDenominator := 10, exponentPower := 3 }

def nextCubit : Cubit → Cubit
  | .north => .east
  | .east => .south
  | .south => .west
  | .west => .north

def previousCubit : Cubit → Cubit
  | .north => .west
  | .east => .north
  | .south => .east
  | .west => .south

def flip : Orientation → Orientation
  | .normal => .inverted
  | .inverted => .normal

def orbit (state : Identity) : Identity :=
  { core := state.core
    cubit := nextCubit state.cubit
    orientation := state.orientation }

def flipIdentity (state : Identity) : Identity :=
  { core := state.core
    cubit := state.cubit
    orientation := flip state.orientation }

def FridayInvariant (state : Identity) : Prop :=
  state.core = .vainl ∧
  state.cubit = .north ∨ state.cubit = .east ∨
  state.cubit = .south ∨ state.cubit = .west

theorem four_outer_cubits : cubits.length = 4 := by
  rfl

theorem two_nested_shells : shells.length = 2 := by
  rfl

theorem friday_scale_is_five : scale.base = 5 := by
  rfl

theorem friday_scale_is_three_point_three_cubed :
    scale.exponentNumerator = 33 ∧
    scale.exponentDenominator = 10 ∧
    scale.exponentPower = 3 := by
  exact ⟨rfl, rfl, rfl⟩

theorem orbit_north_to_east : nextCubit .north = .east := by
  rfl

theorem orbit_wraps_west_to_north : nextCubit .west = .north := by
  rfl

theorem reverse_orbit_undoes_forward (cubit : Cubit) :
    previousCubit (nextCubit cubit) = cubit := by
  cases cubit <;> rfl

theorem double_flip_restores (orientation : Orientation) :
    flip (flip orientation) = orientation := by
  cases orientation <;> rfl

theorem flip_preserves_core (state : Identity) :
    (flipIdentity state).core = state.core := by
  rfl

theorem friday_is_closed : FridayInvariant identity := by
  exact Or.inl ⟨rfl, rfl⟩

end Friday
