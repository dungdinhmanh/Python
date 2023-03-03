s=input('Nhập 1 xâu bất kì: ')
num=[]
n=''
char=0
dx=False
for i in s:
    n=i+n
    if i>='0' and i<='9':
        num.append(i)
    if (i>='A' and i<='Z') or (i>='a' and i<='z'):
        char+=1
if n == s:
    dx=True
    print('Xâu đối xứng')
else:
    print('Xâu ko đối xứng')
print('Xâu được viết ngược lại là:', n)
print('Xâu số có trong xâu vừa nhập là:', ", ".join(num))
print('Số các chữ cái tiếng Anh là:', char)
