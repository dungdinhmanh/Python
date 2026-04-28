// *&a <=> a
#include <stdio.h>

int a;
int *p = &a;
int main () {
    printf("Nhập giá trị a: ");
    scanf("%d", &a);
    printf("Giá trị của a: %d\n", a);
    printf("Địa chỉ của a: %x\n", &a);
    printf("Giá trị a sau khi modify: %d\n", &p+5);
}
