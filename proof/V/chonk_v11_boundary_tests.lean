/-!
V11: vessel boundary tests.

These examples pin down the four boundary cases for the V10 balance rule.
-/

structure VesselHealth where
  leftHealthy : Bool
  centerReady : Bool
  rightHealthy : Bool

def vesselBalanced (vessel : VesselHealth) : Bool :=
  vessel.leftHealthy && vessel.centerReady && vessel.rightHealthy

def allReady : VesselHealth :=
  { leftHealthy := true, centerReady := true, rightHealthy := true }

def leftBoundary : VesselHealth :=
  { leftHealthy := false, centerReady := true, rightHealthy := true }

def centerBoundary : VesselHealth :=
  { leftHealthy := true, centerReady := false, rightHealthy := true }

def rightBoundary : VesselHealth :=
  { leftHealthy := true, centerReady := true, rightHealthy := false }

def J_V11 : VesselHealth → Bool := vesselBalanced

theorem boundary_all_ready : vesselBalanced allReady = true := by
  rfl

theorem boundary_left_failure : vesselBalanced leftBoundary = false := by
  rfl

theorem boundary_center_failure : vesselBalanced centerBoundary = false := by
  rfl

theorem boundary_right_failure : vesselBalanced rightBoundary = false := by
  rfl
