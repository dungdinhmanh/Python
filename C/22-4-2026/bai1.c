#include <stdio.h>

int sum(int n) {
    if (n == 0)
    {
        return 0;
    }
    return n + sum(n-1);
}
int sumx2(int n) {
    if (n == 0) {
        return 0;
    }
    return n + sumx2(n*n);
}
int main()
{
    int n;
    printf("Nhập số n: ");
    scanf("%d", &n);
    printf("Tổng các số từ 1 -> n là: %d\n", sum(n));
    printf("Tổng các số từ 1^2 -> n^2 là: %d\n", sumx2(n));
}
