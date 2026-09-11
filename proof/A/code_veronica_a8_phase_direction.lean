/-!
Code Veronica A8: phase-directed motion.

Even cycles select forward motion; odd cycles select backward motion.
-/

inductive AnimationDirection where
  | forward | backward
deriving DecidableEq

def directionOf (cycles : Nat) : AnimationDirection :=
  if cycles % 2 = 0 then .forward else .backward

def J_CodeVeronicaA8 : Nat → AnimationDirection := directionOf

theorem even_cycle_moves_forward : directionOf 0 = .forward := by
  rfl

theorem odd_cycle_moves_backward : directionOf 1 = .backward := by
  rfl

theorem second_cycle_moves_forward : directionOf 2 = .forward := by
  rfl

theorem third_cycle_moves_backward : directionOf 3 = .backward := by
  rfl
