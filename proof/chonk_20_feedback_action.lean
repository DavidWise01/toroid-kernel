/-!
Chonk 20: feedback becomes a bounded action.

Stable holds position; rising retreats; falling advances. The mapping is
deterministic and contains no unbounded action.
-/

inductive Feedback where
  | stable
  | rising
  | falling
deriving Repr, DecidableEq

inductive Action where
  | hold
  | advance
  | retreat
deriving Repr, DecidableEq

def actionFromFeedback : Feedback → Action
  | .stable => .hold
  | .rising => .retreat
  | .falling => .advance

def J20 : Feedback → Action := actionFromFeedback

theorem stable_holds : actionFromFeedback .stable = .hold := by
  rfl

theorem rising_retires : actionFromFeedback .rising = .retreat := by
  rfl

theorem falling_advances : actionFromFeedback .falling = .advance := by
  rfl

theorem action_is_bounded (feedback : Feedback) :
    actionFromFeedback feedback = .hold ∨
    actionFromFeedback feedback = .advance ∨
    actionFromFeedback feedback = .retreat := by
  cases feedback <;> simp [actionFromFeedback]

