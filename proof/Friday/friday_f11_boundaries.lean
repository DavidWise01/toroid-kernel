/-!
Friday F11: outer-frame boundary tests.

The directional orbit is tested at its wrap boundary and across a complete
four-position cycle, in both orientations.
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

def J_FridayF11 : FridayState → FridayState := orbit

theorem orbit_wrap_boundary :
    orbit { cubit := .west, orientation := .normal } =
      { cubit := .north, orientation := .normal } := by
  rfl

theorem inverted_path_preserves_orientation :
    (orbit { cubit := .west, orientation := .inverted }).orientation = .inverted := by
  rfl

theorem four_orbits_return_to_origin :
    (orbit (orbit (orbit (orbit
      { cubit := .north, orientation := .normal })))).cubit = .north := by
  rfl
