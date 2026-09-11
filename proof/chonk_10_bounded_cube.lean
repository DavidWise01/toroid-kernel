/-!
Chonk 10: 5^3 as the bounded infinity of cube one.

The arithmetic value is exactly 125. The semantic label `boundedInfinity`
means the boundary of the declared first cube; it is not literal Nat infinity.
-/

def cubeOneLimit : Nat := 5 ^ 3

inductive CubeOneState where
  | interior (phase : Nat)
  | boundedInfinity
deriving Repr, DecidableEq

def foldCubeOne (phase : Nat) : CubeOneState :=
  if phase < cubeOneLimit then .interior phase else .boundedInfinity

def J10 (phase : Nat) : CubeOneState := foldCubeOne phase

theorem five_cube_three : 5 ^ 3 = 125 := by
  rfl

theorem cubeOneLimit_is_125 : cubeOneLimit = 125 := by
  rfl

theorem cube_one_boundary_is_bounded_infinity :
    foldCubeOne (5 ^ 3) = .boundedInfinity := by
  rfl

theorem cube_one_boundary_is_stable :
    J10 125 = .boundedInfinity := by
  rfl

theorem cube_one_interior_is_bounded (phase : Nat) (h : phase < 125) :
    foldCubeOne phase = .interior phase := by
  simp [foldCubeOne, cubeOneLimit, h]

