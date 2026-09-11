/-!
Chonk 40: bilateral position-10 Neon vessel.

The vessel is the noble outer shell on both left and right. It contains the
bilateral eye/I inputs and the prefrontal bridge without merging the sides.
-/

structure NeonVessel where
  leftShellSealed : Bool
  rightShellSealed : Bool
  leftEyeI : Int
  prefrontal : Int
  rightEyeI : Int

def vesselReady (v : NeonVessel) : Prop :=
  v.leftShellSealed = true ∧ v.rightShellSealed = true

def J40 : NeonVessel → Prop := vesselReady

theorem bilateral_neon_vessel_ready :
    vesselReady
      { leftShellSealed := true, rightShellSealed := true,
        leftEyeI := 1, prefrontal := 1, rightEyeI := 1 } := by
  decide

theorem left_neon_shell_required (v : NeonVessel)
    (h : vesselReady v) : v.leftShellSealed = true := by
  exact h.1

theorem right_neon_shell_required (v : NeonVessel)
    (h : vesselReady v) : v.rightShellSealed = true := by
  exact h.2

theorem open_right_vessel_blocked :
    ¬ vesselReady
      { leftShellSealed := true, rightShellSealed := false,
        leftEyeI := 1, prefrontal := 1, rightEyeI := 1 } := by
  decide

