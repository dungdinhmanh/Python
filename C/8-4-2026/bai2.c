#include <stdio.h>

int sum, n;
int main () {
    do
    {
        printf("Nhập n trong đoạn 0-5: ");
        scanf("%d", &n);
    } while (0 >= n || n >= 5);
    for (int i = 2; i <= n; i++) {
        int is_prime = 1;
        for (int j = 2; j < i; j++) {
            if (i % j == 0) {
                is_prime = 0;
                break;
            }
        }
        if (is_prime == 1)
        {
            sum += i;
        }
    }
    printf("Tổng các số nguyên tố nhỏ hơn n là: %d\n", sum);
    printf("Số nguyên tố là %d", n);
}