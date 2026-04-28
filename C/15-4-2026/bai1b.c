#include <stdio.h>
#include <stdlib.h>

int n, tmp;
int *p;
int main() {
    printf("Nhập số phần tử trong mảng: ");
    scanf("%d", &n);
    p = (int *)malloc(n * sizeof(int));
    if (p == NULL) {
        printf("Không đủ bộ nhớ!\n");
        return 1;
    }
    for (int i = 0; i < n; i++) {
        printf("Nhập phần tử thứ %d: ", i);
        scanf("%d", &p[i]);
    }
    for (int i = 0; i < n; i++)
    {
        *(p + i) += 10;
    }
    printf("Mảng sau khi tăng lên 10 là: ");
    for (int i = 0; i<n; i++) {
        printf("%d ", *(p+i));
    }
//sort 
    for (int i = 0; i < n; i++)
    {
        for (int j = i+1; j < n; j++)
        {
            if (*(p+i)>*(p+j)) {
                tmp = *(p+i);
                *(p+i)= *(p+j);
                *(p+j) = tmp;
            }
        }
    }
    printf("\nAfter short: ");
    for (int i = 0; i < n; i++)
    {
        printf("%d ", *(p+i));
    }
    free(p);
    return 0;
}
