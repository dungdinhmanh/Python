#include <stdio.h>

int N, m = 0, sum = 0;
int main () {
    do
    {
        printf("Nhập số N: ");
        scanf("%d", &N);
    } while (N < 0);
    while (sum + (m+1) < N )
    {
        m++;
        sum += m;
    } if (sum >= N)
    {
        sum -= m; m--;
    }
    printf("Số m lớn nhất là: %d\n", m);
}