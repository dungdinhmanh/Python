#include <stdio.h>
int main () {
    int n,i;
    printf("Nhập độ dài mảng: ");
    scanf("%d", &n);
    int a[n];
    for (i = 0; i < n; i++)
    {
        printf("Nhập phần tử thứ %d: ", i);
        scanf("%d", &a[i]);
    }
    printf("Mảng vừa nhập: \n");
    for (i = 0; i < n; i++)
    {
        printf("%d ", a[i]);
    }
    
    
}