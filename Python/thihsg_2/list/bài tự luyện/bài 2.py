import re
s=input('Nhập xâu: ').strip()
s1=" ".join(s.split())
print(s1)
d=[]
def space(s):
    n=re.findall("s",s)
    return ''.join(n)
def numsort(s):
    n=re.findall(r'\d',s)
    n.sort()
    return ''.join(n)
def charsort(s):
    n=re.findall(r'[a-zA-Z]',s)
    n.sort()
    return ''.join(n)
d.append(space(s1))
d.append(numsort(s1))
d.append(charsort(s1))
print(', '.join(d))