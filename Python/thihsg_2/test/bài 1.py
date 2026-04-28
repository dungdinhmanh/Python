n,k=list(map(int,input("Nhập n và k: ").split()))
def uoc(n):
    d=0
    for i in range(1, int(n**0.5)+1):
        if n % i == 0:
            if n//i==i:
                d+=1
            else:
                d+=2
    return d
def demuoc(n, k):
    d=0
    for n in range(1, n+1):
        if uoc(n)==k:
            d+=1
    return d
print(demuoc(n, k))