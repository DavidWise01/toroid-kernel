/-!
V1: vessel shell geometry.

The vessel has two explicit outer shells and one contained payload. The shell
is geometry only; sealing and behavior are handled by later V chonks.
-/

inductive ShellSide where
  | left
  | right
deriving Repr, DecidableEq

structure VesselShell where
  side : ShellSide
  radius : Nat

structure VesselGeometry where
  leftShell : VesselShell
  rightShell : VesselShell
  payloadRadius : Nat

def symmetricShells (outer inner : Nat) : VesselGeometry :=
  { leftShell := { side := .left, radius := outer }
    rightShell := { side := .right, radius := outer }
    payloadRadius := inner }

def J_V1 : Nat → Nat → VesselGeometry := symmetricShells

theorem vessel_has_left_shell (outer inner : Nat) :
    (symmetricShells outer inner).leftShell.side = .left := by
  rfl

theorem vessel_has_right_shell (outer inner : Nat) :
    (symmetricShells outer inner).rightShell.side = .right := by
  rfl

theorem vessel_shells_match (outer inner : Nat) :
    (symmetricShells outer inner).leftShell.radius =
    (symmetricShells outer inner).rightShell.radius := by
  rfl

theorem payload_is_inside_shell (outer inner : Nat) (h : inner ≤ outer) :
    (symmetricShells outer inner).payloadRadius ≤
    (symmetricShells outer inner).leftShell.radius := by
  exact h

