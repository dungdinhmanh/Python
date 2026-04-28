#include <stdio.h>

int num;
int main () {
    do
    {
        printf("Nhập số nguyên dương: ");
        scanf("%d", &num);
    } while (num < 1);
    printf("Số vừa nhập là: %d", num);
}