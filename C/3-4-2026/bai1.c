#include <stdio.h>

int number;
int main () {
    printf("Nhập 1 số: ");
    scanf("%d", &number);
    if (number < 1 || number > 9) {
        printf("Không đọc được\n");
    } else printf("%d\n", number);
}