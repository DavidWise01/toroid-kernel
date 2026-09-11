/-!
Code Veronica I: complete Intellect branch, I1 through I12.
-/

namespace CodeVeronicaI

inductive Decision where
  | below | equal | above
deriving DecidableEq

def decide (value target : Int) : Decision :=
  if value < target then .below else if value = target then .equal else .above

theorem I1_below : decide 2 3 = .below := by rfl
theorem I1_equal : decide 3 3 = .equal := by rfl
theorem I1_above : decide 4 3 = .above := by rfl

structure Memory where
  observed : Int

def remember (value : Int) : Memory := { observed := value }
theorem I2_memory : (remember 7).observed = 7 := by rfl

inductive Change where
  | decreased | unchanged | increased
deriving DecidableEq

def detectChange (previous current : Int) : Change :=
  if current < previous then .decreased
  else if current = previous then .unchanged else .increased

theorem I3_change : detectChange 5 4 = .decreased := by rfl

def withinBand (value target radius : Int) : Prop :=
  target - radius ≤ value ∧ value ≤ target + radius

theorem I4_band : withinBand 10 10 1 := by constructor <;> omega

inductive Status where
  | low | stable | high
deriving DecidableEq

def statusOf (value target radius : Int) : Status :=
  if value < target - radius then .low
  else if target + radius < value then .high else .stable

theorem I5_status : statusOf 10 10 1 = .stable := by rfl

inductive Response where
  | raise | hold | lower
deriving DecidableEq

def responseOf : Status → Response
  | .low => .raise
  | .stable => .hold
  | .high => .lower

theorem I6_response : responseOf .stable = .hold := by rfl

def applyResponse (response : Response) (value : Int) : Int :=
  match response with
  | .raise => value + 1
  | .hold => value
  | .lower => value - 1

theorem I7_nudge : applyResponse .raise 10 = 11 := by rfl

def nudgeToward (value target : Int) : Int :=
  if value < target then value + 1
  else if target < value then value - 1 else value

theorem I8_target : nudgeToward 9 10 = 10 := by rfl

def consensus3 (a b c : Bool) : Bool :=
  (a && b) || (a && c) || (b && c)

theorem I9_consensus : consensus3 true true false = true := by rfl

def bit (signal : Bool) : Nat := if signal then 1 else 0
def strength (a b c : Bool) : Nat := bit a + bit b + bit c

theorem I10_strength : strength true true false = 2 := by rfl
theorem I11_boundary : consensus3 true false false = false := by rfl

def IntellectInvariant (a b c : Bool) : Prop := consensus3 a b c = true

theorem I12_invariant : IntellectInvariant true true true := by rfl

end CodeVeronicaI
