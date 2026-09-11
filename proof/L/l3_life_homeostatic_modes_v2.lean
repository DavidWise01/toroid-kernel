/-!
Code Veronica L3 v2: Life homeostatic modes.

Cellular division is modeled as replication and continuation. War is modeled
as destructive pressure. Cooperation is modeled as survival pressure.
-/

inductive LifeMode where
  | cellularDivision
  | war
  | cooperation
deriving DecidableEq

inductive HomeostaticDirection where
  | replication
  | destruction
  | survival
deriving DecidableEq

def directionOf : LifeMode → HomeostaticDirection
  | .cellularDivision => .replication
  | .war => .destruction
  | .cooperation => .survival

def J_CodeVeronicaL3 : LifeMode → HomeostaticDirection := directionOf

theorem division_models_replication :
    directionOf .cellularDivision = .replication := by
  rfl

theorem war_models_destruction :
    directionOf .war = .destruction := by
  rfl

theorem cooperation_models_survival :
    directionOf .cooperation = .survival := by
  rfl
