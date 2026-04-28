#include <stdio.h>

int n,i;
float fcount;
unsigned long long count, fact;
int main () {
    do
    {   
        printf("Nhập n: ");
        scanf("%d", &n);
        if (n < 1) {
        printf("Số nhập vào không hợp lệ! Vui lòng nhập số nguyên dương.\n");
        }
        
    } while (n < 1);
    count = 0;
    for (i = 1; i <= n; i++) {
        count += i;
    }
    printf("a. S = %llu\n", count);
    count = 0;
    for (i = 1; i <= n; i++) {
        count += i*i;
    }
    printf("b. S = %llu\n", count);
    fcount = 0;
    for (i = 1; i <= n; i++) {
        fcount += 1.0f / i;
    }
    printf("c. S = %.1f\n", fcount);
    count = 0, fact = 1;
    for (i = 1; i <= n; i++) {
        fact *= i;
        count += fact;
    }
    printf("d. S = %llu\n", fact);
    printf("e. S = %llu\n", count);
}