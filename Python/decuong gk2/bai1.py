n=int(input('Nhập số phần tử: '))
A=[]
c,sd=0,0
for i in range(n):
    num=int(input('Nhập phần tử thứ '+str(i+1)+': '))
    A.append(num)
for i in A:
    if i%2==0:
        c+=i
    if i>0:
        sd+=1
print('Số lớn nhất trong các số là:', max(A))
print('Số nhỏ nhất trong các số là:', min(A))
print('Số các số dương là:', sd)
print('Tổng các số chẵn là:', c)
