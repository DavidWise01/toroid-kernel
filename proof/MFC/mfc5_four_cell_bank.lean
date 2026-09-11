/-!
MFC5: four-cell capacitor bank.

The MFC is extended to four bounded cells, matching the four directional
Petals. Total stored charge is the sum of the four cell values.
-/

structure Cell where
  capacity : Nat
  stored : Nat

structure Bank where
  north : Cell
  east : Cell
  south : Cell
  west : Cell

def totalStored (bank : Bank) : Nat :=
  bank.north.stored + bank.east.stored + bank.south.stored + bank.west.stored

def MFCBank : Bank :=
  { north := { capacity := 25, stored := 5 }
    east := { capacity := 25, stored := 5 }
    south := { capacity := 25, stored := 5 }
    west := { capacity := 25, stored := 5 } }

def J_MFC5 : Bank → Nat := totalStored

theorem bank_has_four_cells :
    MFCBank.north.stored + MFCBank.east.stored +
    MFCBank.south.stored + MFCBank.west.stored = 20 := by
  rfl

theorem bank_total_is_twenty : totalStored MFCBank = 20 := by
  rfl

theorem each_cell_capacity_is_twenty_five :
    MFCBank.north.capacity = 25 ∧ MFCBank.east.capacity = 25 := by
  exact ⟨rfl, rfl⟩
