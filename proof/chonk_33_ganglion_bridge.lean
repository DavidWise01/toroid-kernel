/-!
Chonk 33: reversible bridge between ganglion anchors A and B.

The bridge is a six-hop local string: three forward hops and three reverse
hops. Closure is required before the bridge is considered complete.
-/

structure GanglionAnchor where
  label : String
  exponentHundredths : Int

def ganglionA : GanglionAnchor :=
  { label := "A", exponentHundredths := -3478 }

def ganglionB : GanglionAnchor :=
  { label := "B", exponentHundredths := -3483 }

structure BridgeTrace where
  start : Nat
  finish : Nat
  forwardHops : Nat
  reverseHops : Nat

def bridgeClosed (trace : BridgeTrace) : Prop :=
  trace.forwardHops = 3 ∧ trace.reverseHops = 3 ∧ trace.start = trace.finish

def J33 : BridgeTrace → Prop := bridgeClosed

theorem ganglion_bridge_closes :
    bridgeClosed { start := 0, finish := 0, forwardHops := 3, reverseHops := 3 } := by
  decide

theorem incomplete_bridge_is_not_closed :
    ¬ bridgeClosed { start := 0, finish := 1, forwardHops := 3, reverseHops := 3 } := by
  decide

