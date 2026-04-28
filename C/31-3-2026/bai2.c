#include <stdio.h>

int power(int base, int exp) {
    int result = 1;
    for (int i = 0; i < exp; i++)
        result *= base;
    return result;
}

int a,b;
int main() {
    printf("Type a, b: ");
    scanf("%d %d", &a, &b);
    printf("Sum of a, b: %d\n", a+b);
    printf("Diffirence of a, b: %d\n", a-b);
    printf("Product of a, b: %d\n", a*b);
    printf("Quotient of a, b: %d\n", a/b);
    printf("Exponentiation of a, b: %d\n", power(a,b));
}