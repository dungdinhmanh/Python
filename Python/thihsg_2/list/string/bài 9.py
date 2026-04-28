n=input('Nhập xâu: ')
count=0
for i in n:
    if (i>="a" and i<="z") or (i>="A" and i<="Z"):
        count+=1
print(("Có {count} chữ cái").format(count=count))