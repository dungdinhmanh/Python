n = int(input("Nhập số nhóm mẫu số liệu: "))
group=[]
for i in range(n):
    child_group=[]
    a, b=map(float,input(f"Nhập nửa khoảng {i+1} (a, b): ").split())
    child_group.append((a,b))
    print(child_group)
    print()