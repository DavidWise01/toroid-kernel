/-!
V8: recoverable vessel safe hold.

Contained states remain normal. Uncontained states enter safe hold, where
the state is retained for later inspection and recovery.
-/

inductive VesselMode where
  | normal
  | safeHold
deriving Repr, DecidableEq

def modeFor (isContained : Bool) : VesselMode :=
  if isContained then .normal else .safeHold

structure HeldState where
  value : Int
  mode : VesselMode

def enterHold (value : Int) : HeldState :=
  { value := value, mode := .safeHold }

def J_V8 : Bool → VesselMode := modeFor

theorem contained_state_is_normal : modeFor true = .normal := by
  rfl

theorem uncontained_state_enters_hold : modeFor false = .safeHold := by
  rfl

theorem hold_preserves_value (value : Int) :
    (enterHold value).value = value := by
  rfl

theorem hold_mode_is_safe (value : Int) :
    (enterHold value).mode = .safeHold := by
  rfl

