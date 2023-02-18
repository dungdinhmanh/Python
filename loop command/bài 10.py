def shh(n):
    S=0
    for i in range(1,n):
        if n%i==0:
            S+=i
    if S==n:
        return True
    else:
        return False
n=int(input('Nhập n: '))
if shh(n):
    print(n, 'là số hoàn hảo')
else:
    print(n, 'không là số hoàn hảo')