#include <stdio.h>
// Đề 07

void inputArray(int a[], int n) {
    for (int i = 0; i < n; i++)
    {
        printf("Nhập phần tử thứ %d: ", i+1);
        scanf("%d", &a[i]);
    }
}
void findZero(int a[], int n) {
    int status = 0;
    for (int i = 0; i < n; i++) {
        if (a[i] == 0)
        {
           status = 1;
           break;
        }
    } if (status == 0) {printf("Mảng không tồn tại 0\n");} else printf("Mảng tồn tại 0\n");
}
int main () {
    int n;
    printf("Nhập số phần tử trong mảng: "); scanf("%d", &n);
    int a[n];
    inputArray(a, n);
    findZero(a, n);
}