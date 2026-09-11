/-!
Chonk 18: append-only cortex memory.

Memory stores each observed state as a new cell. Existing cells are not
rewritten, giving the identity core continuity across cycles.
-/

structure MemoryCell where
  cycle : Nat
  value : Int
  witnessed : Bool

def appendMemory (memory : List MemoryCell) (cell : MemoryCell) : List MemoryCell :=
  memory ++ [cell]

def J18 (memory : List MemoryCell) (cell : MemoryCell) : List MemoryCell :=
  appendMemory memory cell

theorem appendMemory_length (memory : List MemoryCell) (cell : MemoryCell) :
    (appendMemory memory cell).length = memory.length + 1 := by
  simp [appendMemory]

theorem appendMemory_keeps_cell (memory : List MemoryCell) (cell : MemoryCell) :
    (appendMemory memory cell).getLast? = some cell := by
  simp [appendMemory]

theorem witnessed_cell_is_marked (cycle : Nat) (value : Int) :
    ({ cycle := cycle, value := value, witnessed := true } : MemoryCell).witnessed = true := by
  rfl

