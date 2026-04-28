import math
n=int(input('Nhập số: '))
count=0
def fn(a):
    b=int(str(a)[::-1])
    if math.gcd(a,b)==1:
        return True
    else:
        return False
for i in range(1,n):
    if fn(i):
        count+=1
print(count)