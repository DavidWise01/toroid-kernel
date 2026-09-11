/-!
Code Veronica L4 v2: four factions, two channels, one box.

The boundary consists of four competing factions plus two channels (one
ingress and one egress), for six total forces around one resource box.
-/

structure Boundary where
  factions : Nat
  channels : Nat
  boxes : Nat

def totalForces (boundary : Boundary) : Nat :=
  boundary.factions + boundary.channels

inductive Strategy where
  | compete
  | cooperate
deriving DecidableEq

inductive Outcome where
  | collapse
  | survival
deriving DecidableEq

def outcome (boundary : Boundary) (strategy : Strategy) : Outcome :=
  if boundary.boxes = 1 ∧ totalForces boundary = 6 then
    match strategy with
    | .compete => .collapse
    | .cooperate => .survival
  else
    .survival

def J_CodeVeronicaL4 : Boundary → Strategy → Outcome := outcome

def boundary : Boundary :=
  { factions := 4, channels := 2, boxes := 1 }

theorem four_factions : boundary.factions = 4 := by
  rfl

theorem two_ingress_egress_channels : boundary.channels = 2 := by
  rfl

theorem six_total_forces : totalForces boundary = 6 := by
  rfl

theorem one_box_boundary : boundary.boxes = 1 := by
  rfl

theorem competition_collapses_boundary :
    outcome boundary .compete = .collapse := by
  rfl

theorem cooperation_survives_boundary :
    outcome boundary .cooperate = .survival := by
  rfl
