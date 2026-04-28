#include <stdio.h>

int N, sum = 0;
int main () {
    do
    {
        printf("Nhập số N: ");
        scanf("%d", &N);
    } while (N < 0);
    for (int i = 1; i < N; i++)
    {
        if ((i%2) != 0) {
        sum += i;
        }
    }
    printf("Tổng các số lẻ là: %d\n", sum);
}