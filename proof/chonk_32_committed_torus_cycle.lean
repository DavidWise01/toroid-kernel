/-!
Chonk 32: committed bounded torus cycle.

This joins the verified commit rule to the 256-position wraparound geometry.
-/

import Std.Tactic

inductive Action where
  | hold
  | advance
  | retreat
deriving Repr, DecidableEq

def torusNext (position : Nat) : Action → Nat
  | .hold => position
  | .advance => if position = 255 then 0 else position + 1
  | .retreat => if position = 0 then 255 else position - 1

structure TorusCycle where
  before : Nat
  after : Nat
  action : Action
  witnessed : Bool
  continuous : Bool

def committedTorusCycle (c : TorusCycle) : Bool :=
  c.before < 256 &&
  c.after < 256 &&
  c.witnessed &&
  c.continuous &&
  c.after = torusNext c.before c.action

def J32 : TorusCycle → Bool := committedTorusCycle

theorem committed_torus_wrap :
    committedTorusCycle
      { before := 255, after := 0, action := .advance,
        witnessed := true, continuous := true } = true := by
  rfl

theorem committed_torus_reverse_wrap :
    committedTorusCycle
      { before := 0, after := 255, action := .retreat,
        witnessed := true, continuous := true } = true := by
  rfl

theorem uncommitted_torus_wrap_is_blocked :
    committedTorusCycle
      { before := 255, after := 0, action := .advance,
        witnessed := false, continuous := true } = false := by
  rfl

