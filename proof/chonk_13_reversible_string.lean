/-!
Chonk 13: derived reversible torus geometry.

Ganglia A and B are anchor labels. The geometric primitive here is a
three-edge forward traversal followed by the same three edges backward.
This file proves the route shape and closure of one segment only.
-/

inductive Direction where
  | forward
  | backward
deriving Repr, DecidableEq

structure Ganglion where
  label : String
  exponentHundredths : Int

def ganglionA : Ganglion :=
  { label := "A", exponentHundredths := -3478 }

def ganglionB : Ganglion :=
  { label := "B", exponentHundredths := -3483 }

def forward3Backward3 : List Int := [0, 1, 2, 3, 2, 1, 0]

def J13 : List Int := forward3Backward3

theorem ganglionA_anchor : ganglionA.exponentHundredths = -3478 := by
  rfl

theorem ganglionB_anchor : ganglionB.exponentHundredths = -3483 := by
  rfl

theorem reversible_string_shape :
    forward3Backward3 = [0, 1, 2, 3, 2, 1, 0] := by
  rfl

theorem reversible_string_closes :
    forward3Backward3.getLast? = some 0 := by
  rfl

theorem reversible_string_has_seven_samples :
    forward3Backward3.length = 7 := by
  rfl

