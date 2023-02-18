def ucln(m,n):
    while (m!=n):
        if (m>n):
            m-=n
        else:
            n-=m
    ucln=m
    return ucln
def bcnn(m,n):
    return(int(m*n)//ucln(m,n))
m=int(input('Nhập m: '))
n=int(input('Nhập n: '))
print('Ước chung lớn nhất của', m, 'và', n, 'là:', ucln(m,n))
print('Bội chung nhỏ nhất của', m, 'và', n, 'là:', bcnn(m,n))