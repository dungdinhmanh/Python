n=int(input('Nhập 1 số: '))
flag=True
if n<2:
    flag==False
elif n==2:
    flag==True
elif n%2==0:
    flag==False
else:
    for i in range(3,n,2):
        if n%i==0:
            flag=False
if flag==True:
    print(n, 'là số nguyên tố')
else:
    print(n, 'ko là số nguyên tố')