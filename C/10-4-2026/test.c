#include <stdio.h>

int n, is_prime;
int main () {
    printf("Nhập số n: ");
    scanf("%d", &n);
    for (int i = 2; i <= n; i++) {
        is_prime = 1;
        for (int j = 2; j < i; j++) {
            if (i % j == 0) {
                is_prime = 0;
                break;
            }
        }       
    }
    if (is_prime == 1) {
        printf("%d là số nguyên tố\n", n);
    } else {printf("%d không là số nguyên tố\n", n);}
}