/-!
V12: final vessel invariant.

The vessel is valid exactly when all three required regions are ready:
left, center, and right.
-/

structure Vessel where
  leftReady : Bool
  centerReady : Bool
  rightReady : Bool

def VInvariant (vessel : Vessel) : Prop :=
  vessel.leftReady = true ∧
  vessel.centerReady = true ∧
  vessel.rightReady = true

def vesselPasses (vessel : Vessel) : Bool :=
  vessel.leftReady && vessel.centerReady && vessel.rightReady

def J_V12 : Vessel → Prop := VInvariant

theorem final_v_invariant_iff (vessel : Vessel) :
    VInvariant vessel ↔ vesselPasses vessel = true := by
  constructor
  · intro h
    rcases h with ⟨hl, hc, hr⟩
    simp [vesselPasses, hl, hc, hr]
  · intro h
    simp [vesselPasses] at h
    exact h

theorem final_vessel_is_closed :
    VInvariant { leftReady := true, centerReady := true, rightReady := true } := by
  exact ⟨rfl, rfl, rfl⟩

theorem final_vessel_rejects_left_failure :
    ¬ VInvariant { leftReady := false, centerReady := true, rightReady := true } := by
  intro h
  cases h.1

theorem final_vessel_rejects_center_failure :
    ¬ VInvariant { leftReady := true, centerReady := false, rightReady := true } := by
  intro h
  cases h.2.1

theorem final_vessel_rejects_right_failure :
    ¬ VInvariant { leftReady := true, centerReady := true, rightReady := false } := by
  intro h
  cases h.2.2
