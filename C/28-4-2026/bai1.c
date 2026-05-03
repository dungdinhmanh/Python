#include <stdio.h>

float sum(int n) {
    if (n==0) return 0;
    return 1.0f/n + sum(n-1);
}
int main () {
    int n;
    printf("Nhập vào số n: "); scanf("%d", &n);
    printf("Tổng của 1 + 1/2 + 1/n là: %.2f\n", sum(n));
}