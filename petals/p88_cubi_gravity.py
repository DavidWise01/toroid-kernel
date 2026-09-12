"""Petals P88: exact finite cubi gravity equation.

Symbolic/discrete model only: F = sign * mass / distance_squared.
"""
from dataclasses import dataclass
from fractions import Fraction
from enum import Enum

class Sign(Enum):
    PULL=-1; NEUTRAL=0; PUSH=1

@dataclass(frozen=True)
class Point:
    x:int; y:int; z:int
    def distance_squared(self,other:"Point")->int:
        return (self.x-other.x)**2+(self.y-other.y)**2+(self.z-other.z)**2

def cubi_force(observer:Point,source:Point,mass:int,sign:Sign)->Fraction:
    d2=observer.distance_squared(source)
    if d2==0: raise ValueError("observer and source cannot share a point")
    return Fraction(sign.value*mass,d2)

def main()->None:
    center=Point(0,0,0); corner=Point(1,1,1)
    assert corner.distance_squared(center)==3
    assert cubi_force(center,corner,3,Sign.PULL)==Fraction(-1,1)
    assert cubi_force(center,corner,3,Sign.PUSH)==Fraction(1,1)
    assert cubi_force(center,Point(1,0,0),1,Sign.PULL)==Fraction(-1,1)
    try: cubi_force(center,center,1,Sign.PULL)
    except ValueError: pass
    else: raise AssertionError("zero-distance field was accepted")
    print("P88 PASS: exact cubi inverse-square field computes without floating point")

if __name__=="__main__": main()
