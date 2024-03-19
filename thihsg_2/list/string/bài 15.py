import re
n=input('Nhập xâu: ')
s=re.findall(r'\d+',n)
print(" ".join(s))