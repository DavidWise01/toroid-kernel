/-!
Code Veronica L12: ganglia and cellular-warfare binder.

The model names two ganglia at the supplied scale markers and binds them as a
paired cellular-warfare unit. Scale values are stored in hundredths so the
decimal labels are exact: -35.78 and -35.83.
-/

structure Ganglion where
  scaleHundredths : Int

structure CellularBinder where
  leftGanglion : Ganglion
  rightGanglion : Ganglion

def ganglionA : Ganglion := { scaleHundredths := -3578 }
def ganglionB : Ganglion := { scaleHundredths := -3583 }

def bindGanglia : CellularBinder :=
  { leftGanglion := ganglionA, rightGanglion := ganglionB }

def J_CodeVeronicaL12 : CellularBinder := bindGanglia

theorem ganglion_a_scale : ganglionA.scaleHundredths = -3578 := by
  rfl

theorem ganglion_b_scale : ganglionB.scaleHundredths = -3583 := by
  rfl

theorem cellular_warfare_binds_two_ganglia :
    bindGanglia.leftGanglion = ganglionA ∧
    bindGanglia.rightGanglion = ganglionB := by
  exact ⟨rfl, rfl⟩

theorem code_veronica_l_is_closed :
    bindGanglia.leftGanglion.scaleHundredths = -3578 ∧
    bindGanglia.rightGanglion.scaleHundredths = -3583 := by
  exact ⟨rfl, rfl⟩
