#include <stdio.h>

int m,n, choice = 0;
int main () {
    printf("Nhập số hàng: ");
    scanf("%d", &m);
    printf("Nhập số cột: ");
    scanf("%d", &n);
    int a[m][n];
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
        printf("Nhập phần tử ở hàng %d cột %d: ", i+1, j+1);
        scanf("%d", &a[i][j]);
        }
    }
    printf("      \nMENU\n"
    "1. Giá trị lớn nhất\n"
    "2. Giá trị nhỏ nhất\n"
    "3. Max/min của hàng\n"
    "4. Max/min của cột\n"
    "5. Tìm x tồn tại và đưa ra vị trí đầu tiên tìm được\n"
    "6. Sắp xếp mảng tăng dần\n"
    "7. Tổng 2 ma trận\n"
    "8. Các phần tử trên đường chéo chính/phụ\n"
    "9. Tổng các phần tử trên đường chéo chính/phụ\n"
    "0. Exit\n"
    );
    
    printf("\n Nhập lựa chọn: "); scanf("%d", &choice);
    switch (choice)
    {
    case 1:
        int max = a[0][0];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (max < a[i][j]) {
                    max = a[i][j];
                }
            }
        }
        printf("Giá trị lớn nhất: %d\n", max);
        break;
    case 2:
        int min = a[0][0];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (min > a[i][j]) {
                    min = a[i][j];
                }
            }
        }
        printf("Giá trị nhỏ nhất: %d\n", min);
        break;
    case 3:
        int max, min;
        for (int i = 0; i < m; i++) {
            max = a[i][0]; min = a[i][0];
            for (int j = 0; j < n; j++)
            {
                if (max < a[i][j]) max = a[i][j];
                if (min > a[i][j]) min = a[i][j];
            }
            printf("Hàng %d: Max = %d, Min = %d\n", i+1, max, min);
        }
        break;
    case 4:
        int max, min;
        for (int j = 0; j < n; j++) {
            max = a[0][j]; min = a[0][j];
            for (int i = 0; i < m; i++) {
                if (max < a[i][j]) max = a[i][j];
                if (min > a[i][j]) min = a[i][j];
            }
            printf("Cột %d: Max = %d, Min = %d\n", j+1, max, min);
        }
        break;
    case 5:
        int x, pos;
        
        break;
    case 6:
        break;
    case 7:
        break;
    case 8:
        break;
    case 9:
        break;
    default:
        break;
    }
    
    
}