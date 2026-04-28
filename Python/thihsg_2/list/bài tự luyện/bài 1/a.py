import re
s=input('Nhập xâu: ')
count=0
for i in s:
    if (i>='0' and i<='9'):
        count+=1
s1=re.findall(r'\D+', s)
print(f"Số lượng chữ số có trong xâu là {count}")
print(" ".join(s1))