/-!
Code Veronica L5: reverse-oriented mitosis sequence.

The four-stage cell sequence is represented forward and backward. The reverse
sequence is the same stages traversed in the opposite orientation.
-/

inductive MitosisStage where
  | prophase
  | metaphase
  | anaphase
  | telophase
deriving DecidableEq

def forwardStages : List MitosisStage :=
  [.prophase, .metaphase, .anaphase, .telophase]

def reverseStages : List MitosisStage :=
  [.telophase, .anaphase, .metaphase, .prophase]

def J_CodeVeronicaL5 : List MitosisStage := reverseStages

theorem reverse_mitosis_is_upside_down_traversal :
    reverseStages = [
      .telophase, .anaphase, .metaphase, .prophase] := by
  rfl

theorem forward_mitosis_starts_at_prophase :
    forwardStages.head? = some .prophase := by
  rfl

theorem reverse_mitosis_starts_at_telophase :
    reverseStages.head? = some .telophase := by
  rfl

theorem both_sequences_have_four_stages :
    forwardStages.length = 4 ∧ reverseStages.length = 4 := by
  exact ⟨rfl, rfl⟩
