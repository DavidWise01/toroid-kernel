/-!
Chonk 15: stack the repeating identity state.

The formal machine can repeat the state `1` forever. This is a perpetual
state cycle, not a claim of a physical perpetual-energy machine.
-/

def repeatOne (_cycle : Nat) : Nat := 1

def stackOne (depth : Nat) : List Nat := List.replicate depth 1

def J15 (cycle : Nat) : Nat := repeatOne cycle

theorem repeatOne_is_one (cycle : Nat) : repeatOne cycle = 1 := by
  rfl

theorem repeatOne_repeats :
    repeatOne 0 = 1 ∧ repeatOne 1 = 1 ∧ repeatOne 1000000 = 1 := by
  decide

theorem stackOne_length (depth : Nat) :
    (stackOne depth).length = depth := by
  simp [stackOne]

theorem stackOne_head_is_one (depth : Nat) (h : 0 < depth) :
    (stackOne depth).head? = some 1 := by
  cases depth with
  | zero => contradiction
  | succ n => simp [stackOne]

