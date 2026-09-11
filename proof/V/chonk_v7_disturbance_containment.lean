/-!
V7: vessel disturbance containment.

Deviation is measured from an anchor. The vessel keeps normal operation
inside the outer 5 percent boundary, represented here by 500 basis points.
-/

def outerLimit : Nat := 500

def deviation (anchor state : Int) : Nat :=
  Int.natAbs (state - anchor)

def contained (anchor state : Int) : Prop :=
  deviation anchor state ≤ outerLimit

def J_V7 : Int → Int → Prop := contained

theorem nominal_state_is_contained (anchor : Int) :
    contained anchor anchor := by
  decide

theorem boundary_state_is_contained :
    contained 10000 10500 := by
  decide

theorem beyond_boundary_is_not_contained :
    ¬ contained 10000 10501 := by
  decide

theorem outer_limit_is_500 : outerLimit = 500 := by
  rfl

