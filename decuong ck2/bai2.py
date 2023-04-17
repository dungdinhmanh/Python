def str_reverse(n):     #Hàm đảo ngược xâu
    s=''
    for i in n:
        s=i+s
    print('Xâu được đảo ngược là:', s)
def num_in_str(n):      #Hàm in các số có trong xâu ra màn hình
    s=[]
    n=''
    for i in n:
        if i>='0' and i<='9':
            s.append(i)
            n+=i
    print('Các số có trong xâu vừa nhập là:', ", ".join(s))
def char_sequence(n):   #Hàm đếm số chữ cái Tiếng Anh trong xâu
    char=0
    for i in n:
        if (i>='A' and i<='Z') or (i>='a' and i<='z'):
            char+=1
    print('Có', char, 'chữ cái tiếng Anh trong xâu')
def str_symmetry(n):    #Kiểm tra xâu đối xứng
    s=''
    for i in n:
        s=i+n
    if n==s:
        print('Xâu đối xứng')
    else:
        print('Xâu không đối xứng')

s=input('Nhập 1 xâu: ')
str_reverse(s)
num_in_str(s)
char_sequence(s)
str_symmetry(s)