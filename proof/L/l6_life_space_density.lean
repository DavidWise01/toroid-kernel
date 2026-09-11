/-!
Code Veronica L6: space, count, and density.

The number of forces and the amount of available space are independent. A
large space can contain many forces without making them a dense cluster.
-/

structure Field where
  forces : Nat
  space : Nat

def hasRoom (field : Field) : Prop :=
  field.forces ≤ field.space

def J_CodeVeronicaL6 : Field → Prop := hasRoom

theorem four_forces_can_have_large_space :
    hasRoom { forces := 4, space := 100 } := by
  decide

theorem many_forces_are_still_present :
    ({ forces := 4, space := 100 } : Field).forces = 4 := by
  rfl

theorem crowded_field_has_no_extra_room :
    ¬ hasRoom { forces := 6, space := 4 } := by
  intro h
  decide at h

theorem space_does_not_change_force_count :
    ({ forces := 6, space := 100 } : Field).forces = 6 := by
  rfl
