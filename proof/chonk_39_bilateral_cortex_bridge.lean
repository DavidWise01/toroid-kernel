/-!
Chonk 39: bilateral cortex bridge.

The bridge carries the left eye/I signal through the prefrontal cortex to the
right eye/I signal. Both sides remain distinct inputs to one central junction.
-/

structure BilateralBridge where
  leftEyeI : Int
  prefrontal : Int
  rightEyeI : Int

def bridgeSignal (b : BilateralBridge) : Int :=
  b.leftEyeI + b.prefrontal + b.rightEyeI

def bridgeConnected (b : BilateralBridge) : Prop :=
  b.leftEyeI = b.prefrontal ∧ b.prefrontal = b.rightEyeI

def J39 : BilateralBridge → Int := bridgeSignal

theorem bridge_has_left_eye_I (b : BilateralBridge) :
    bridgeSignal b = b.leftEyeI + b.prefrontal + b.rightEyeI := by
  rfl

theorem symmetric_bridge_is_connected (value : Int) :
    bridgeConnected { leftEyeI := value, prefrontal := value, rightEyeI := value } := by
  decide

theorem unequal_bridge_is_not_connected :
    ¬ bridgeConnected { leftEyeI := 1, prefrontal := 2, rightEyeI := 1 } := by
  decide

