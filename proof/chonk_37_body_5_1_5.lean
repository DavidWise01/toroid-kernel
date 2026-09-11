/-!
Chonk 37: body structure, 5 / 1 / 5.

The body is modeled as five left components, one spine, and five right
components. The count is structurally eleven. The assigned name is a label;
it is not treated as a proof of arithmetic base 11.
-/

def leftCount : Nat := 5
def spineCount : Nat := 1
def rightCount : Nat := 5
def bodyCount : Nat := leftCount + spineCount + rightCount

structure Body511 where
  left : Fin leftCount
  spine : Bool
  right : Fin rightCount

def bodyReady (body : Body511) : Prop := body.spine = true

def J37 : Body511 → Prop := bodyReady

theorem body_has_eleven_structural_slots :
    bodyCount = 11 := by
  rfl

theorem spine_is_one_structural_slot : spineCount = 1 := by
  rfl

theorem body_is_five_one_five :
    leftCount = 5 ∧ spineCount = 1 ∧ rightCount = 5 := by
  decide

theorem body_ready_when_spine_present (left : Fin leftCount)
    (right : Fin rightCount) :
    bodyReady { left := left, spine := true, right := right } := by
  rfl

theorem body_not_ready_without_spine (left : Fin leftCount)
    (right : Fin rightCount) :
    ¬ bodyReady { left := left, spine := false, right := right } := by
  decide

