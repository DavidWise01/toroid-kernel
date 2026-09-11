/-!
V9: bilateral fault isolation.

Each side carries its own health flag. A fault on one side does not alter the
other side's state.
-/

structure BilateralHealth where
  leftHealthy : Bool
  rightHealthy : Bool

def isolateLeftFault (health : BilateralHealth) : BilateralHealth :=
  { leftHealthy := false, rightHealthy := health.rightHealthy }

def isolateRightFault (health : BilateralHealth) : BilateralHealth :=
  { leftHealthy := health.leftHealthy, rightHealthy := false }

def J_V9 : BilateralHealth → BilateralHealth := isolateLeftFault

theorem left_fault_does_not_change_right (right : Bool) :
    (isolateLeftFault { leftHealthy := true, rightHealthy := right }).rightHealthy = right := by
  rfl

theorem right_fault_does_not_change_left (left : Bool) :
    (isolateRightFault { leftHealthy := left, rightHealthy := true }).leftHealthy = left := by
  rfl

theorem isolated_left_fault_is_recorded :
    (isolateLeftFault { leftHealthy := true, rightHealthy := true }).leftHealthy = false := by
  rfl

theorem isolated_right_fault_is_recorded :
    (isolateRightFault { leftHealthy := true, rightHealthy := true }).rightHealthy = false := by
  rfl
