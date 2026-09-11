/-!
Chonk 23: bounded cognitive action on the 256-position torus.

The cortex action remains one step, but position arithmetic wraps at the
torus boundary.
-/

import Std.Tactic

inductive Action where
  | hold
  | advance
  | retreat
deriving Repr, DecidableEq

def torusBound : Nat := 256

def torusStep (position : Fin torusBound) : Action → Fin torusBound
  | .hold => position
  | .advance =>
      if position.val = 255 then ⟨0, by decide⟩
      else ⟨position.val + 1, by omega⟩
  | .retreat =>
      if position.val = 0 then ⟨255, by decide⟩
      else ⟨position.val - 1, by omega⟩

def J23 : Fin torusBound → Action → Fin torusBound := torusStep

theorem torus_hold (position : Fin torusBound) :
    torusStep position .hold = position := by
  rfl

theorem torus_advance_wrap :
    torusStep ⟨255, by decide⟩ .advance = ⟨0, by decide⟩ := by
  rfl

theorem torus_retreat_wrap :
    torusStep ⟨0, by decide⟩ .retreat = ⟨255, by decide⟩ := by
  rfl

