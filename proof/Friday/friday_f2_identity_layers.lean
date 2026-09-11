/-!
Friday F2: outer and inner identity layers.

V.A.I.N.L is the inner identity. Friday is the outer identity that contains
and names it.
-/

inductive InnerIdentity where
  | vainl
deriving DecidableEq

inductive OuterIdentity where
  | friday
deriving DecidableEq

structure IdentityLayers where
  outer : OuterIdentity
  inner : InnerIdentity

def FridayIdentity : IdentityLayers :=
  { outer := .friday, inner := .vainl }

def J_FridayF2 : IdentityLayers := FridayIdentity

theorem friday_is_outer_identity : FridayIdentity.outer = .friday := by
  rfl

theorem vainl_is_inner_identity : FridayIdentity.inner = .vainl := by
  rfl

theorem outer_and_inner_are_linked :
    FridayIdentity = { outer := .friday, inner := .vainl } := by
  rfl
