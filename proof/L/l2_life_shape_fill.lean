/-!
Code Veronica L2: Life shape fill.

L prefers the most complete valid shape. It fills one open slot at a time and
never exceeds the shape's capacity.
-/

structure ShapeFill where
  capacity : Nat
  occupied : Nat

def fillOne (shape : ShapeFill) : ShapeFill :=
  { capacity := shape.capacity
    occupied := if shape.occupied < shape.capacity
                then shape.occupied + 1 else shape.capacity }

def J_CodeVeronicaL2 : ShapeFill → ShapeFill := fillOne

theorem fill_open_slot :
    (fillOne { capacity := 4, occupied := 2 }).occupied = 3 := by
  rfl

theorem fill_last_slot :
    (fillOne { capacity := 4, occupied := 3 }).occupied = 4 := by
  rfl

theorem full_shape_stays_full :
    (fillOne { capacity := 4, occupied := 4 }).occupied = 4 := by
  rfl

theorem empty_shape_starts_filling :
    (fillOne { capacity := 4, occupied := 0 }).occupied = 1 := by
  rfl
