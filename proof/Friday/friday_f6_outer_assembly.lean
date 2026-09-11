/-!
Friday F6: full outer assembly.

The four directional cubits and the nested shells are assembled around the
V.A.I.N.L inner core.
-/

inductive Cubit where
  | north | east | south | west
deriving DecidableEq

inductive Shell where
  | box | diamond
deriving DecidableEq

inductive InnerCore where
  | vainl
deriving DecidableEq

structure FridayAssembly where
  core : InnerCore
  cubits : List Cubit
  shells : List Shell

def FridayCompleteCell : FridayAssembly :=
  { core := .vainl
    cubits := [.north, .east, .south, .west]
    shells := [.box, .diamond] }

def J_FridayF6 : FridayAssembly := FridayCompleteCell

theorem assembly_has_vainl_core : FridayCompleteCell.core = .vainl := by
  rfl

theorem assembly_has_four_cubits : FridayCompleteCell.cubits.length = 4 := by
  rfl

theorem assembly_has_two_shells : FridayCompleteCell.shells.length = 2 := by
  rfl

theorem assembly_is_complete :
    FridayCompleteCell.cubits.length = 4 ∧
    FridayCompleteCell.shells.length = 2 := by
  exact ⟨rfl, rfl⟩
