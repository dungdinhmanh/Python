#include <stdio.h>

int m, n, x;
int main () {
    printf("Nhập số hàng và cột: ");
    scanf("%d %d", &m, &n);
    int a[m][n];
    for (int i = 0; i < m; i++)
    {
        printf("Nhập giá trị theo hàng a[%d]: ", i);
        scanf("%d", &a[i]);
    }
    for (int j = 0; j < n; j++) {
            printf("Nhập giá trị theo cột a[%d]: ", j);
            scanf("%d", &a[j]);
        }
    printf("Nhập số cần tìm: "); scanf("%d",&x);
    for (int i = 0; i < m; i++) {
        int exist;
        for (int j = 0; j < n; j++) {
            if (a[i][j] == x)
            {
                exist = 1;
            } else {exist = 0;}
        }
        if (exist == 1) {
            printf("%d tồn tại trong mảng\n", x);
        } else {printf("%d không tồn tại trong mảng\n", x);}
    }
}