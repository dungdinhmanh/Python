def count_trl_triplets(trl):
    trl.sort()
    n=len(trl)
    count = 0
    for i in range(n-2):
        k=i+2
        for j in range(i + 1, n - 1):
            while k<n and trl[i]+trl[j]>trl[k]:
                k+=1
            count+=k-j-1

    return count
n = int(input("Nhập số lượng phần tử của dãy: "))
trl= list(map(int, input("Nhập dãy số nguyên dương, cách nhau bởi dấu cách: ").split()))
if len(trl)>=3:
    print("Số lượng bộ số tam giác trong dãy là:", count_trl_triplets(trl))
else:
    print("Dãy không đủ phần tử để tạo thành bộ số tam giác.")
