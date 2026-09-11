/-!
Chonk 36: bridge admission gate.

The bridge opens only after dual anchor validation and reversible trace
closure. This keeps the derived geometry bounded and auditable.
-/

structure BridgeAdmission where
  gangliaValid : Bool
  forwardHops : Nat
  reverseHops : Nat
  startsAtFinish : Bool

def bridgeAdmitted (b : BridgeAdmission) : Bool :=
  b.gangliaValid &&
  b.forwardHops = 3 &&
  b.reverseHops = 3 &&
  b.startsAtFinish

def J36 : BridgeAdmission → Bool := bridgeAdmitted

theorem closed_valid_bridge_admitted :
    bridgeAdmitted
      { gangliaValid := true, forwardHops := 3,
        reverseHops := 3, startsAtFinish := true } = true := by
  rfl

theorem open_bridge_blocked :
    bridgeAdmitted
      { gangliaValid := true, forwardHops := 3,
        reverseHops := 3, startsAtFinish := false } = false := by
  rfl

theorem invalid_ganglia_bridge_blocked :
    bridgeAdmitted
      { gangliaValid := false, forwardHops := 3,
        reverseHops := 3, startsAtFinish := true } = false := by
  rfl

