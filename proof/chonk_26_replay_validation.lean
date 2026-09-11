/-!
Chonk 26: replay validation for an append-only torus history.

The validator walks the ledger in order. Empty history is valid; a history
is valid only when its head transition is valid and its tail is valid.
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

def validEvent (event : TorusEvent) : Bool :=
  event.before < 256 && event.after = expectedAfter event.before event.action

def replayValid : List TorusEvent → Bool
  | [] => true
  | event :: rest => validEvent event && replayValid rest

def J26 : List TorusEvent → Bool := replayValid

theorem replay_empty : replayValid [] = true := by
  rfl

theorem replay_single_wrap :
    replayValid [{ before := 255, action := .advance, after := 0 }] = true := by
  rfl

theorem replay_rejects_bad_event :
    replayValid [{ before := 255, action := .advance, after := 255 }] = false := by
  rfl

theorem replay_cons_valid (event : TorusEvent) (rest : List TorusEvent)
    (hEvent : validEvent event = true) (hRest : replayValid rest = true) :
    replayValid (event :: rest) = true := by
  simp [replayValid, hEvent, hRest]

