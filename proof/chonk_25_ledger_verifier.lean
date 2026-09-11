/-!
Chonk 25: verify torus ledger events.

An event is valid only when its recorded after-state matches the bounded
action rule, including wraparound at 0 and 255.
-/

inductive Action where
  | hold
  | advance
  | retreat
deriving Repr, DecidableEq

structure TorusEvent where
  before : Nat
  action : Action
  after : Nat

def expectedAfter (before : Nat) : Action → Nat
  | .hold => before
  | .advance => if before = 255 then 0 else before + 1
  | .retreat => if before = 0 then 255 else before - 1

def validEvent (event : TorusEvent) : Prop :=
  event.before < 256 ∧ event.after = expectedAfter event.before event.action

def J25 : TorusEvent → Prop := validEvent

theorem valid_advance_wrap :
    validEvent { before := 255, action := .advance, after := 0 } := by
  decide

theorem valid_retreat_wrap :
    validEvent { before := 0, action := .retreat, after := 255 } := by
  decide

theorem valid_hold (position : Nat) (h : position < 256) :
    validEvent { before := position, action := .hold, after := position } := by
  exact ⟨h, rfl⟩

