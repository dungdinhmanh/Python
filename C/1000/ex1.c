#include <stdio.h>

int findMax(int m, int n,int a[m][n]) {
    int max = a[0][0];
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (a[i][j] > max) {
                max = a[i][j];
            }
        }
    }
    return max;
}

int findMin(int m, int n,int a[m][n]) {
    int min = a[0][0];
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (a[i][j] < min) {
                min = a[i][j];
            }
        }
    }
    return min;
}

void printMaxMin(int m, int n, int a[m][n]) {
    int max = a[0][0];
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            
        }
    }
}
int main (){
    int m,n;
    printf("Nhập số hàng, cột: "); scanf("%d %d", &m, &n);
    int a[m][n];
    for (int i = 0; i<m; i++) {
        for (int j = 0; j < n; j++){
            printf("Nhập giá trị hàng %d cột %d: ", i, j);
            scanf("%d", &a[i][j]); 
        }
    }
    printf("Mảng 2 chiều: ");
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d ", a[i][j]);
        } printf("\n");
    }   
}