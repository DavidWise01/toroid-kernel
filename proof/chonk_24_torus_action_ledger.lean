/-!
Chonk 24: append-only ledger for torus actions.

Every bounded move is recorded as a new event. The ledger is replayable and
its prior entries remain in place.
-/

inductive Action where
  | hold
  | advance
  | retreat
deriving Repr, DecidableEq

structure TorusEvent where
  cycle : Nat
  before : Nat
  action : Action
  after : Nat

def appendEvent (ledger : List TorusEvent) (event : TorusEvent) : List TorusEvent :=
  ledger ++ [event]

def J24 (ledger : List TorusEvent) (event : TorusEvent) : List TorusEvent :=
  appendEvent ledger event

theorem ledger_length_increases (ledger : List TorusEvent) (event : TorusEvent) :
    (appendEvent ledger event).length = ledger.length + 1 := by
  simp [appendEvent]

theorem ledger_keeps_latest (ledger : List TorusEvent) (event : TorusEvent) :
    (appendEvent ledger event).getLast? = some event := by
  simp [appendEvent]

theorem wrap_event_is_recordable :
    appendEvent []
      { cycle := 0, before := 255, action := .advance, after := 0 } |>.length = 1 := by
  rfl

