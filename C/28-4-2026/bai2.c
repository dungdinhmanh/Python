#include <stdio.h>

void inputArray(int a[], int n) {
    for (int i = 0; i < n; i++)
    {
        printf("Nhập số phần tử thứ %d: ", i+1); scanf("%d", &a[i]);
    }
}
int sumNegative(int a[], int n) {
    int sum;
    for (int i = 0; i < n; i++)
    {
        if (a[i] < 0) {
            sum += a[i];
        }
    }
    return sum;
}

int main() {
    int n;
    printf("Nhập số phần tử của mảng: "); scanf("%d", &n);
    int a[n];
    inputArray(a, n);
    printf("Tổng các số âm là: %d\n", sumNegative(a, n));
}
