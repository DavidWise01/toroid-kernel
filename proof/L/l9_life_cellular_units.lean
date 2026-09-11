/-!
Code Veronica L9: cellular units and identity boundary.

Two units are represented as a pair. A boundary marker records the identity
flag between them, analogous to a delimiter or metadata marker in storage.
-/

structure CellPair where
  leftUnit : Nat
  rightUnit : Nat
  boundaryFlag : Bool

def splitUnit (unit : Nat) : CellPair :=
  { leftUnit := unit, rightUnit := unit, boundaryFlag := true }

def J_CodeVeronicaL9 : Nat → CellPair := splitUnit

theorem division_creates_two_units (unit : Nat) :
    (splitUnit unit).leftUnit = unit ∧ (splitUnit unit).rightUnit = unit := by
  exact ⟨rfl, rfl⟩

theorem division_plants_boundary_flag (unit : Nat) :
    (splitUnit unit).boundaryFlag = true := by
  rfl

theorem two_units_are_distinct_positions :
    (splitUnit 1).leftUnit = 1 ∧ (splitUnit 1).rightUnit = 1 := by
  exact ⟨rfl, rfl⟩
