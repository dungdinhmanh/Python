n=int(input('Nhập n: '))
S=0
for i in range(1,n):
    if i%2!=0:
        S=(n**2)+i
print(S)