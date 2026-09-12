/-- Petals P129: core-only Lean model of the integrated witness decision. -/

structure Point where
  x : Int
  y : Int
  z : Int
deriving BEq, Repr

structure TraceWitness where
  start : Point
  hop6 : Point
  hop12 : Point
  lengthOK : Bool
  onShell : Bool
deriving Repr

def TraceWitness.valid (trace : TraceWitness) : Bool :=
  trace.lengthOK &&
  trace.onShell &&
  trace.start == trace.hop6 &&
  trace.hop6 == trace.hop12

def quorum (a b c : Bool) : Bool :=
  (a && b) || (a && c) || (b && c)

def integratedDecision (trace : TraceWitness) (a b c : Bool) : Bool :=
  trace.valid && quorum a b c

def home : Point := ⟨1, 0, 0⟩

def validTrace : TraceWitness := {
  start := home
  hop6 := home
  hop12 := home
  lengthOK := true
  onShell := true
}

def invalidTrace : TraceWitness := {
  start := home
  hop6 := home
  hop12 := ⟨0, 1, 0⟩
  lengthOK := true
  onShell := true
}

theorem quorum_accepts_two : quorum true true false = true := by
  rfl

theorem quorum_rejects_one : quorum true false false = false := by
  rfl

theorem valid_tick_ready : integratedDecision validTrace true true false = true := by
  rfl

theorem invalid_tick_halts : integratedDecision invalidTrace true true true = false := by
  rfl

#eval integratedDecision validTrace true true false
#eval integratedDecision invalidTrace true true true
