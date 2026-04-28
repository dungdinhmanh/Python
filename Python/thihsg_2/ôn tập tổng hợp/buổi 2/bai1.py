import math
r=int(input('Nhập bán kính: '))
x0,y0=map(int,input('Nhập vị trí tâm O theo x,y: ').split())
a,b=map(int,input('Nhập vị trí điểm A bất kì theo x,y: ').split())
d=math.sqrt((a-x0)**2+(b-y0)**2)
if d==r:
    print('Điểm A nằm trong hình tròn')
else:
    print('Điểm A nằm ngoài đường tròn')