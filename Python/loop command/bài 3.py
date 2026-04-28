n=int(input('Nhập n: '))
for i in range(n, -1, -1):
    if i>0 and i%2==0:
        print(i, end=' ')