n=int(input('Nhập n: '))
d=list(map(int,input('Nhập phần tử: ').split()))
def maximum(n):
    a=max(n)
    b=n.index(a)
    print(a, b)
def minimum(n):
    a=min(n)
    b=n.index(a)
    print(a,b)
maximum(d)
minimum(d)