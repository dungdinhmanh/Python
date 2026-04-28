#include <stdio.h>

void inputArray(int m, int n, int a[m][n]) {
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {
            printf("Nhập giá trị hàng %d cột %d: ", i+1, j+1);
            scanf("%d", &a[i][j]);
        }
    }
}
void outputArray(int m, int n, int a[m][n]) {
    printf("Các phần tử trong mảng là: ");
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; i++)
        {
            printf("%d ", a[i][j]);
        }
        
    }
    
}
int main()
{
    int m, n;
    printf("Nhập số hàng: "); scanf("%d", &m);
    printf("Nhập số cột: "); scanf("%d", &n);
    int a[m][n];
    inputArray(m, n, a);
    outputArray(m, n, a);
}