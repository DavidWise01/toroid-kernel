/-!
Friday F10: orientation-aware cubit orbit.

Circulation changes the outer position while preserving the current shell
orientation.
-/

inductive Cubit where
  | north | east | south | west
deriving DecidableEq

inductive Orientation where
  | normal | inverted
deriving DecidableEq

structure FridayState where
  cubit : Cubit
  orientation : Orientation

def nextCubit : Cubit → Cubit
  | .north => .east
  | .east => .south
  | .south => .west
  | .west => .north

def orbit (state : FridayState) : FridayState :=
  { cubit := nextCubit state.cubit, orientation := state.orientation }

def J_FridayF10 : FridayState → FridayState := orbit

theorem orbit_moves_north_to_east :
    orbit { cubit := .north, orientation := .normal } =
      { cubit := .east, orientation := .normal } := by
  rfl

theorem orbit_preserves_inverted_orientation :
    (orbit { cubit := .west, orientation := .inverted }).orientation = .inverted := by
  rfl

theorem orbit_preserves_normal_orientation :
    (orbit { cubit := .south, orientation := .normal }).orientation = .normal := by
  rfl
