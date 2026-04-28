import re
n=input('Nhập xâu: ')
s=re.findall(r'\D+',n)
print(" ".join(s))