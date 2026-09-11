/-!
Friday F8: reverse outer-cubit circulation.

The four-cubit ring supports both directions. A reverse step undoes a forward
step.
-/

inductive Cubit where
  | north | east | south | west
deriving DecidableEq

def forward : Cubit → Cubit
  | .north => .east
  | .east => .south
  | .south => .west
  | .west => .north

def backward : Cubit → Cubit
  | .north => .west
  | .east => .north
  | .south => .east
  | .west => .south

def J_FridayF8 : Cubit → Cubit := backward

theorem backward_from_north : backward .north = .west := by
  rfl

theorem backward_from_west : backward .west = .south := by
  rfl

theorem forward_then_backward_returns (c : Cubit) :
    backward (forward c) = c := by
  cases c <;> rfl
