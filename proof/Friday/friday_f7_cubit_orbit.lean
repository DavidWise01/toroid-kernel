/-!
Friday F7: outer-cubit circulation.

The four logical cubits form a closed directional ring around the inner core.
-/

inductive Cubit where
  | north | east | south | west
deriving DecidableEq

def nextCubit : Cubit → Cubit
  | .north => .east
  | .east => .south
  | .south => .west
  | .west => .north

def J_FridayF7 : Cubit → Cubit := nextCubit

theorem cubit_orbit_forward :
    nextCubit .north = .east ∧
    nextCubit .east = .south ∧
    nextCubit .south = .west := by
  exact ⟨rfl, rfl, rfl⟩

theorem cubit_orbit_wraps : nextCubit .west = .north := by
  rfl

theorem four_steps_return_to_origin :
    nextCubit (nextCubit (nextCubit (nextCubit .north))) = .north := by
  rfl
