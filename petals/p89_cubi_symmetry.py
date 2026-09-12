"""Petals P89: exact symmetry sum for the eight cubi corners."""
from fractions import Fraction
from itertools import product

def corner_field(corner:tuple[int,int,int])->Fraction:
    d2=sum(axis*axis for axis in corner)
    return Fraction(corner[0],d2)

def main()->None:
    corners=tuple(product((-1,1),repeat=3))
    assert len(corners)==8
    assert sum((corner_field(c) for c in corners),Fraction(0,1))==0
    assert corner_field((-1,-1,-1))==-corner_field((1,-1,-1))
    print("P89 PASS: eight cubi corners cancel to exact net field zero")

if __name__=="__main__": main()
