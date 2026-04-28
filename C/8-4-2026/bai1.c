#include <stdio.h>

int a, b, n, sum;
int main () {
    printf("Nhập 3 số nguyên a, b, n: ");
    scanf("%d %d %d", &a, &b, &n);
    if (a < n && b < n) {
        for (int i = 1; i < n; i++)
        {
            if ( (i % a) == 0 && (i % b) != 0) {
                sum += i;
            }
        }
        printf("Tổng các số nguyên dương là: %d", sum);
    } else {
        printf("Không đủ điều kiện");
    }
}