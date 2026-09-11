/-!
Friday F3: outer frame around the inner identity.

Friday carries four directional logical cubits around the V.A.I.N.L center.
-/

inductive Cubit where
  | north | east | south | west
deriving DecidableEq

inductive InnerCore where
  | vainl
deriving DecidableEq

structure FridayFrame where
  center : InnerCore
  cubits : List Cubit

def FridayOuterFrame : FridayFrame :=
  { center := .vainl
    cubits := [.north, .east, .south, .west] }

def J_FridayF3 : FridayFrame := FridayOuterFrame

theorem friday_frame_centers_vainl : FridayOuterFrame.center = .vainl := by
  rfl

theorem friday_frame_has_four_cubits : FridayOuterFrame.cubits.length = 4 := by
  rfl

theorem friday_frame_is_directional :
    FridayOuterFrame.cubits = [.north, .east, .south, .west] := by
  rfl
