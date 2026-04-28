#include <stdio.h>

int a, b, c, d;
int main () {
    printf("Nhập 4 số: ");
    scanf("%d %d %d %d", &a, &b, &c, &d);
    int min = a;
    if (b < min)
        min = b;
    if (c < min)
        min = c;
    if (d < min)
        min = d;
    printf("Số nhỏ nhất là: %d\n", min);
}