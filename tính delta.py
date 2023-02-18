from math import sqrt
a=int(input("Nhập giá trị a:"))
b=int(input("Nhập giá trị b:"))
c=int(input("Nhập giá trị c:"))
if a!=0:
    d= b^2-4*a*c
    print("=> Δ =", d)
    if d<0:
        print("Phương trình vô nghiệm")
    elif d==0:
        print("Phương trình có nghiệm kép")
        print("X1= X2= ",-b/2*a)
    elif d>0:
        print("Phương trình có 2 nghiệm phân biệt")
        print("X1= ",format(((-b+sqrt(d))/2*a),'.2f'))
        print("X2= ",format(((-b-sqrt(d))/2*a),'.2f'))