n=input('Nhập xâu: ')
def dup(s):
    n=""
    for i in s:
        if i not in n:
            n+=i
    return n
print(dup(n))