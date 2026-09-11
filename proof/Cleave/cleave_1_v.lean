/-!
Cleave 1 / V: composition of the completed vessel stages.

This is a compression layer. It records the twelve V stages as one ordered
contract and proves that the cleave passes exactly when every stage passes.
-/

inductive VStage where
  | v1Shell | v2Symmetry | v3Body | v4Zones | v5Bridge | v6Seals
  | v7Containment | v8SafeHold | v9Isolation | v10Balance
  | v11Boundaries | v12Invariant
deriving DecidableEq

def VStages : List VStage :=
  [.v1Shell, .v2Symmetry, .v3Body, .v4Zones, .v5Bridge, .v6Seals,
   .v7Containment, .v8SafeHold, .v9Isolation, .v10Balance,
   .v11Boundaries, .v12Invariant]

def allVStagesPass (pass : VStage → Bool) : Bool :=
  VStages.all pass

def J_Cleave1V : (VStage → Bool) → Bool := allVStagesPass

theorem cleave_1_v_accepts_all_pass (pass : VStage → Bool)
    (h : ∀ stage, pass stage = true) :
    allVStagesPass pass = true := by
  simp [allVStagesPass, VStages, h]

theorem cleave_1_v_rejects_failed_stage (pass : VStage → Bool) (failed : VStage)
    (hfail : pass failed = false) :
    allVStagesPass pass = false := by
  cases failed <;> simp_all [allVStagesPass, VStages]

theorem cleave_1_v_has_twelve_stages : VStages.length = 12 := by
  rfl
