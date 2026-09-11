/-!
V5: bilateral cortex bridge inside the vessel.

Left and right inputs meet through one prefrontal spine. The bridge is
connected when both sides and the central spine are present.
-/

structure CortexBridge where
  leftInput : Bool
  prefrontalSpine : Bool
  rightInput : Bool

def bridgeConnected (b : CortexBridge) : Prop :=
  b.leftInput = true ∧
  b.prefrontalSpine = true ∧
  b.rightInput = true

def J_V5 : CortexBridge → Prop := bridgeConnected

theorem bilateral_bridge_connected :
    bridgeConnected
      { leftInput := true, prefrontalSpine := true, rightInput := true } := by
  decide

theorem missing_left_blocks_bridge :
    ¬ bridgeConnected
      { leftInput := false, prefrontalSpine := true, rightInput := true } := by
  decide

theorem missing_spine_blocks_bridge :
    ¬ bridgeConnected
      { leftInput := true, prefrontalSpine := false, rightInput := true } := by
  decide

theorem missing_right_blocks_bridge :
    ¬ bridgeConnected
      { leftInput := true, prefrontalSpine := true, rightInput := false } := by
  decide

