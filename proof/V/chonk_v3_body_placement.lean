/-!
V3: place the 5 / 1 / 5 body inside the vessel.

Five left slots, one spine, and five right slots are kept as distinct
interior components.
-/

def leftSlots : Nat := 5
def spineSlots : Nat := 1
def rightSlots : Nat := 5
def bodySlots : Nat := leftSlots + spineSlots + rightSlots

structure VesselBody where
  left : Fin leftSlots
  spine : Bool
  right : Fin rightSlots

def bodyPlaced (body : VesselBody) : Prop := body.spine = true

def J_V3 : VesselBody → Prop := bodyPlaced

theorem body_slot_count_is_eleven : bodySlots = 11 := by
  rfl

theorem body_is_five_one_five :
    leftSlots = 5 ∧ spineSlots = 1 ∧ rightSlots = 5 := by
  decide

theorem body_placement_requires_spine (left : Fin leftSlots)
    (right : Fin rightSlots) :
    bodyPlaced { left := left, spine := true, right := right } := by
  rfl

theorem body_without_spine_is_not_placed (left : Fin leftSlots)
    (right : Fin rightSlots) :
    ¬ bodyPlaced { left := left, spine := false, right := right } := by
  decide

