/-!
Chonk 19: deterministic feedback classification.

The cortex compares a current value with a remembered value and emits one
of three bounded signals: stable, rising, or falling.
-/

inductive Feedback where
  | stable
  | rising
  | falling
deriving Repr, DecidableEq

def classifyFeedback (current remembered : Int) : Feedback :=
  if current = remembered then .stable
  else if current > remembered then .rising
  else .falling

def J19 : Int → Int → Feedback := classifyFeedback

theorem feedback_equal (value : Int) :
    classifyFeedback value value = .stable := by
  simp [classifyFeedback]

theorem feedback_rising :
    classifyFeedback 2 1 = .rising := by
  rfl

theorem feedback_falling :
    classifyFeedback 1 2 = .falling := by
  rfl

theorem feedback_is_bounded (current remembered : Int) :
    classifyFeedback current remembered = .stable ∨
    classifyFeedback current remembered = .rising ∨
    classifyFeedback current remembered = .falling := by
  by_cases h₁ : current = remembered
  · left; simp [classifyFeedback, h₁]
  · by_cases h₂ : current > remembered
    · right; left; simp [classifyFeedback, h₁, h₂]
    · right; right; simp [classifyFeedback, h₁, h₂]

