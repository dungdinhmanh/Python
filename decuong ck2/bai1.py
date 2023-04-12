def prntsc(n):
    print('Dãy số vừa nhập là: ', end='')
    for i in n:
        print(i+1, end=' ')
    print()
def is_prime(n):
    if n<2:
        return False
    for i in range(2, int(n**0.5)+1):
        if n % i == 0:
            return False
    return True
def prime(n):
    a=[]
    for i in n:
        if is_prime(i):
            a.append(i)
    print('Các số nguyên tố trong dãy là: ', end='')
    for i in a:
        print(i, end=' ')
    print()
def divisible3(n):
    count=0
    for i in n:
        if i%3==0:
            count+=1
    print('Có', count, 'số dương chia hết cho 3')
def sumplus(n):
    sum=0
    for i in n:
        if i>=0:
            sum+=i
    print('Tổng các số dương trong dãy là:', sum)

n=int(input('Nhập số phần tử: '))
ds=[ ]
for i in range(n):
    num=int(input('Nhập phần tử thứ '+str(i+1)+' : '))
    ds.append(i)
prntsc(ds)
prime(ds)
divisible3(ds)
sumplus(ds)