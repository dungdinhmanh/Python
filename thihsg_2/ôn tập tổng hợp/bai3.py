a,b,c,M=map(int,input('Nhập 4 số: ').split())
x=a*b
y=a*c
z=b*c
if x>y and x>z:
    print(x%M)
elif y>x and y>z:
    print(y%M)
else:
    print(z%M)
