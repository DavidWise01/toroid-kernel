/-!
Code Veronica I2: intellect memory.

The kernel stores the last observed value and can compare that stored value
with a target without changing the observation.
-/

structure IntellectMemory where
  observed : Int

def remember (value : Int) : IntellectMemory :=
  { observed := value }

def compareRemembered (memory : IntellectMemory) (target : Int) : Ordering :=
  compare memory.observed target

def J_CodeVeronicaI2 : Int → IntellectMemory := remember

theorem memory_preserves_observation (value : Int) :
    (remember value).observed = value := by
  rfl

theorem remembered_value_is_less :
    compareRemembered (remember 2) 3 = .lt := by
  rfl

theorem remembered_value_is_equal :
    compareRemembered (remember 3) 3 = .eq := by
  rfl

theorem remembered_value_is_greater :
    compareRemembered (remember 4) 3 = .gt := by
  rfl
