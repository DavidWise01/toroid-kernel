/-!
Code Veronica L3: Life homeostatic modes.

This file formalizes the systems analogy between competitive division and
cooperative survival. It does not claim that biological mitosis is inherently
destructive.
-/

inductive LifeMode where
  | division
  | war
  | cooperation
deriving DecidableEq

inductive HomeostaticDirection where
  | destruction
  | survival
deriving DecidableEq

def directionOf : LifeMode → HomeostaticDirection
  | .division => .destruction
  | .war => .destruction
  | .cooperation => .survival

def J_CodeVeronicaL3 : LifeMode → HomeostaticDirection := directionOf

theorem division_models_destructive_pressure :
    directionOf .division = .destruction := by
  rfl

theorem war_models_destructive_pressure :
    directionOf .war = .destruction := by
  rfl

theorem cooperation_models_survival_pressure :
    directionOf .cooperation = .survival := by
  rfl
