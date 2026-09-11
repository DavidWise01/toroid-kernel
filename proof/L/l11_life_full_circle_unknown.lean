/-!
Code Veronica L11: full-circle uncertainty.

The surrounding field is divided into four directional sectors. Every contact
starts unknown; movement is cleared only after the contact is classified.
-/

inductive Sector where
  | north | east | south | west
deriving DecidableEq

inductive ContactStatus where
  | unknown
  | friend
  | foe
deriving DecidableEq

def allSectors : List Sector := [.north, .east, .south, .west]

def canClassify (status : ContactStatus) : Prop :=
  status = .friend ∨ status = .foe

def J_CodeVeronicaL11 : ContactStatus → Prop := canClassify

theorem unknown_is_not_classified : ¬ canClassify .unknown := by
  intro h
  cases h with
  | inl h => cases h
  | inr h => cases h

theorem friend_is_classified : canClassify .friend := by
  exact Or.inl rfl

theorem foe_is_classified : canClassify .foe := by
  exact Or.inr rfl

theorem full_circle_has_four_sectors : allSectors.length = 4 := by
  rfl
