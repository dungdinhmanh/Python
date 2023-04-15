import os
def prntsc(n):      #In dãy số vừa nhập ra màn hình
    print('Dãy số vừa nhập là: ', end='')
    for i in n:
        print(i+1, end=' ')
    print()
def is_prime(n):        #Hàm kiểm tra xem số có phải số nguyên tố không
    if n<2:
        return False
    for i in range(2, int(n**0.5)+1):
        if n % i == 0:
            return False
    return True
def prime(n):       #Hàm in ra các số nguyên tố có trong dãy
    a=[]
    for i in n:
        if is_prime(i):
            a.append(i)
    print('Các số nguyên tố trong dãy là: ', end='')
    for i in a:
        print(i, end=' ')
    print()
def divisible3(n):      #Hàm in ra số lượng các số dương chia hết cho 3
    count=0
    for i in n:
        if i%3==0:
            count+=1
    print('Có', count, 'số dương chia hết cho 3')
def sumplus(n):     #Hàm tính tổng các số dương trong dãy
    sum=0
    for i in n:
        if i>=0:
            sum+=i
    print('Tổng các số dương trong dãy là:', sum)

number=int(input('Nhập số phần tử: '))
ds=[ ]
for i in range(number):
    num=int(input('Nhập phần tử thứ '+str(i+1)+' : '))
    ds.append(i)
prntsc(ds)
prime(ds)
divisible3(ds)
sumplus(ds)