/-!
V10: vessel-wide balance.

The vessel passes only when both sides are healthy. The center is the balance
bridge; it does not replace either side.
-/

structure VesselHealth where
  leftHealthy : Bool
  centerReady : Bool
  rightHealthy : Bool

def vesselBalanced (vessel : VesselHealth) : Bool :=
  vessel.leftHealthy && vessel.centerReady && vessel.rightHealthy

def J_V10 : VesselHealth → Bool := vesselBalanced

theorem balanced_when_all_ready :
    vesselBalanced { leftHealthy := true, centerReady := true, rightHealthy := true } = true := by
  rfl

theorem unbalanced_when_left_failed :
    vesselBalanced { leftHealthy := false, centerReady := true, rightHealthy := true } = false := by
  rfl

theorem unbalanced_when_center_not_ready :
    vesselBalanced { leftHealthy := true, centerReady := false, rightHealthy := true } = false := by
  rfl

theorem unbalanced_when_right_failed :
    vesselBalanced { leftHealthy := true, centerReady := true, rightHealthy := false } = false := by
  rfl
