/-!
Code Veronica: complete V.A.I.N.L model.

V.A.I.N is the vessel. L is life: reciprocal learning, correction, and
continuation. The 2 nm value is retained as a model parameter.
-/

namespace CodeVeronica

/- V: Vessel -/
structure Vessel where
  leftReady : Bool
  centerReady : Bool
  rightReady : Bool

def vesselInvariant (v : Vessel) : Prop :=
  v.leftReady = true ∧ v.centerReady = true ∧ v.rightReady = true

theorem V_closed :
    vesselInvariant { leftReady := true, centerReady := true, rightReady := true } := by
  exact ⟨rfl, rfl, rfl⟩

/- A: Animation -/
inductive Frame where
  | frame0 | frame1 | frame2
deriving DecidableEq

def nextFrame : Frame → Frame
  | .frame0 => .frame1
  | .frame1 => .frame2
  | .frame2 => .frame0

def animationInvariant (_ : Frame) : Prop := True

theorem A_forward_cycle :
    nextFrame (nextFrame (nextFrame .frame0)) = .frame0 := by
  rfl

theorem A_closed (frame : Frame) : animationInvariant frame := by
  trivial

/- I: Intellect -/
def consensus3 (a b c : Bool) : Bool :=
  (a && b) || (a && c) || (b && c)

def intellectInvariant (a b c : Bool) : Prop := consensus3 a b c = true

theorem I_accepts_two_of_three : intellectInvariant true true false := by
  rfl

theorem I_rejects_one_of_three : ¬ intellectInvariant true false false := by
  intro h
  cases h

/- N: Nourishment -/
structure Nourishment where
  resource : Nat
  reserve : Nat
  capacity : Nat

def nourishmentInvariant (n : Nourishment) : Prop :=
  n.reserve ≤ n.resource ∧ n.resource ≤ n.capacity

theorem N_closed :
    nourishmentInvariant { resource := 5, reserve := 3, capacity := 10 } := by
  constructor <;> decide

theorem N_rejects_below_reserve :
    ¬ nourishmentInvariant { resource := 2, reserve := 3, capacity := 10 } := by
  intro h
  omega

theorem N_rejects_above_capacity :
    ¬ nourishmentInvariant { resource := 11, reserve := 3, capacity := 10 } := by
  intro h
  omega

/- L: Life -/
inductive LifeMode where
  | cellularDivision
  | cooperation
  | warfare
deriving DecidableEq

inductive LifeDirection where
  | replication
  | survival
  | destruction
deriving DecidableEq

def lifeDirection : LifeMode → LifeDirection
  | .cellularDivision => .replication
  | .cooperation => .survival
  | .warfare => .destruction

theorem L_division_replication :
    lifeDirection .cellularDivision = .replication := by
  rfl

theorem L_cooperation_survival :
    lifeDirection .cooperation = .survival := by
  rfl

theorem L_warfare_destruction :
    lifeDirection .warfare = .destruction := by
  rfl

structure LearningLoop where
  observation : Int
  correction : Int

def learn (loop : LearningLoop) : LearningLoop :=
  { observation := loop.observation + loop.correction
    correction := 0 }

theorem L_learning_applies_correction :
    (learn { observation := 10, correction := 1 }).observation = 11 := by
  rfl

theorem L_learning_clears_applied_correction :
    (learn { observation := 10, correction := 1 }).correction = 0 := by
  rfl

/- Exact model label for the stated scale gap: 2 nanometers. -/
def lifeGapNanometers : Nat := 2

theorem L_gap_parameter : lifeGapNanometers = 2 := by
  rfl

/- Full closure -/
structure CompleteSystem where
  vessel : Vessel
  animationFrame : Frame
  intellectPass : Bool
  nourishment : Nourishment
  lifeGap : Nat

def systemInvariant (system : CompleteSystem) : Prop :=
  vesselInvariant system.vessel ∧
  animationInvariant system.animationFrame ∧
  system.intellectPass = true ∧
  nourishmentInvariant system.nourishment ∧
  system.lifeGap = 2

def CodeVeronica : CompleteSystem :=
  { vessel := { leftReady := true, centerReady := true, rightReady := true }
    animationFrame := .frame0
    intellectPass := true
    nourishment := { resource := 5, reserve := 3, capacity := 10 }
    lifeGap := lifeGapNanometers }

theorem CodeVeronica_closed : systemInvariant CodeVeronica := by
  unfold systemInvariant CodeVeronica
  constructor
  · exact V_closed
  constructor
  · exact A_closed .frame0
  constructor
  · rfl
  constructor
  · exact N_closed
  · rfl

end CodeVeronica
