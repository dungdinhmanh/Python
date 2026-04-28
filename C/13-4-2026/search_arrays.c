#include <stdio.h>
int main () {
    int n, i, f;
    printf("Nhập độ dài mảng: ");
    scanf("%d", &n);
    int a[n];
    for (i = 0; i < n; i++) {
        printf("Nhập phần tử thứ %d: ", i);
        scanf("%d", &a[i]);
    }
    printf("Nhập vị trí cần tìm: ");
    scanf("%d", &f);
    printf("Giá trị cần tìm: %d\n", a[f]);
}
