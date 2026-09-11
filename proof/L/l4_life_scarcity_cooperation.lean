/-!
Code Veronica L4: scarcity and cooperation.

At the boundary case of one resource box and six forces, competition is modeled
as collapse while cooperation is modeled as shared survival.
-/

inductive Strategy where
  | compete
  | cooperate
deriving DecidableEq

inductive Outcome where
  | collapse
  | survival
deriving DecidableEq

def outcome (boxes forces : Nat) (strategy : Strategy) : Outcome :=
  if boxes = 1 ∧ forces = 6 then
    match strategy with
    | .compete => .collapse
    | .cooperate => .survival
  else
    .survival

def J_CodeVeronicaL4 : Nat → Nat → Strategy → Outcome := outcome

theorem six_forces_one_box_competition_collapses :
    outcome 1 6 .compete = .collapse := by
  rfl

theorem six_forces_one_box_cooperation_survives :
    outcome 1 6 .cooperate = .survival := by
  rfl

theorem boundary_has_one_box : (1 : Nat) = 1 := by
  rfl

theorem boundary_has_six_forces : (6 : Nat) = 6 := by
  rfl
