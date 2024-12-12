s1=input('Nhập xâu 1: ')
s2=input('Nhập xâu 2: ')
def dup(s):
    n=""
    for i in s:
        if i not in n:
            n+=i
    return sorted(n)
if dup(s1)==dup(s2):
    print("Xâu 1 và xâu 2 là xâu bạn bè")
else:
    print('2 xâu không là xâu bạn bè')