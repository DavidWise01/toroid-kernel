/-!
Code Veronica I6: response selection.

Each interpreted status selects one deterministic response while preserving the
separation between observation and action.
-/

inductive Status where
  | low | stable | high
deriving DecidableEq

inductive Response where
  | raise | hold | lower
deriving DecidableEq

def responseOf : Status → Response
  | .low => .raise
  | .stable => .hold
  | .high => .lower

def J_CodeVeronicaI6 : Status → Response := responseOf

theorem low_selects_raise : responseOf .low = .raise := by
  rfl

theorem stable_selects_hold : responseOf .stable = .hold := by
  rfl

theorem high_selects_lower : responseOf .high = .lower := by
  rfl
