/-!
V6: sealed vessel ingress and egress.

Inputs and outputs are held unless the corresponding boundary gate is sealed.
No value is discarded by a closed gate.
-/

structure VesselIO where
  ingressSealed : Bool
  egressSealed : Bool

def ingress (io : VesselIO) (value : Int) : Option Int :=
  if io.ingressSealed then some value else none

def egress (io : VesselIO) (value : Int) : Option Int :=
  if io.egressSealed then some value else none

def J_V6 : VesselIO → Int → Option Int := fun io value => ingress io value

theorem sealed_ingress_accepts (value : Int) :
    ingress { ingressSealed := true, egressSealed := true } value = some value := by
  rfl

theorem open_ingress_holds (value : Int) :
    ingress { ingressSealed := false, egressSealed := true } value = none := by
  rfl

theorem sealed_egress_releases (value : Int) :
    egress { ingressSealed := true, egressSealed := true } value = some value := by
  rfl

theorem open_egress_holds (value : Int) :
    egress { ingressSealed := true, egressSealed := false } value = none := by
  rfl

