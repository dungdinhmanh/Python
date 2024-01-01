from fractions import Fraction
a,b,c,d=map(int,input('Nhập 4 số: ').split())
print(Fraction(a,b)-Fraction(c,d))