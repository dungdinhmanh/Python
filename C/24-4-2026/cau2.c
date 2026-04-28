#include <stdio.h>

void inputArray (int m, int n, int a[m][n]) {
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {
            printf("Nhập phần tử hàng %d cột %d: ", i+1, j+1);
            scanf("%d", &a[i][j]);
        }   
    }
}

void findMax(int m, int n, int a[m][n]) {
    int max = a[0][0];
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {
            if (max < a[i][j])
            {
                max = a[i][j];
            }
        }   
    }
    printf("Giá trị lớn nhất là %d\n", max);
}

int main () {
    int m,n;
    printf("Nhập số hàng: "); scanf("%d", &m);
    printf("Nhập số cột: "); scanf("%d", &n);
    int a[m][n];
    inputArray(m, n, a);
    findMax(m, n, a);
}