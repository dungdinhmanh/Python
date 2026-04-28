n=input('Nhập xâu: ')
d=[]
for i in n:
    if i>="1" and i<="9":
        d.append(i)
print(''.join(d))