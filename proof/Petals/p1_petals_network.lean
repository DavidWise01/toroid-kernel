/-!
Petals P1: network star around Friday.

The first Petals topology has four directional network nodes, each linked to
the Friday center.
-/

inductive Petal where
  | north | east | south | west
deriving DecidableEq

structure Link where
  petal : Petal
  center : Bool

def Petals : List Petal := [.north, .east, .south, .west]

def linkToFriday (petal : Petal) : Link :=
  { petal := petal, center := true }

def J_PetalsP1 : Petal → Link := linkToFriday

theorem petals_has_four_nodes : Petals.length = 4 := by
  rfl

theorem north_links_to_friday : (linkToFriday .north).center = true := by
  rfl

theorem east_links_to_friday : (linkToFriday .east).center = true := by
  rfl

theorem south_links_to_friday : (linkToFriday .south).center = true := by
  rfl

theorem west_links_to_friday : (linkToFriday .west).center = true := by
  rfl
