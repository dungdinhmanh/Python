s='halloween 012023'
kq=False
for i in range(len(s)-1):
    if s[i]=='0' and s[i+1]=='2':
        kq=True
        break
print(kq)