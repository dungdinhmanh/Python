#include <stdio.h>

int sum(int n) {
    if (n==1) return 1;
    return n + sum(n-1);
}
int main () {
    int n;
    printf("Nhập số n cần tính: "); scanf("%d", &n);
    printf("Kết quả: %d", sum(n));
}