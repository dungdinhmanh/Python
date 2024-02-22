import math
def test_snt(n):
    snt=[]
    while n%2==0:
        snt.append(2)
        n=n/2
    for i in range(3,int(math.sqrt(n))+1,2):
        while n%i==0:
            snt.append(i)
            n=n/i
    if n>2:
        snt.append(n)
    return snt
def check_snt(m,n):
    if m<=1 or n<=1:
        return False
    snt_m=test_snt(m)
    snt_n=test_snt(n)
    return snt_m==snt_n
x, y=map(int,input('Nhập 2 số: ').split())
if check_snt(x,y):
    print(f"{x} và {y} là số nguyên tố tương đương")
else:
    print(f"{x} và {y} không phải là số nguyên tố tương đương")