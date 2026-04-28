#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

void inputArray(int *p, int n) {
    for (int i = 0; i < n; i++)
    {
        printf("Nhập phần tử thứ %d: ", i+1);
        scanf("%d", &p[i]);
    }
}
void outArray(int *p, int n) {
    printf("Phần tử đã nhập: ");
    for (int i = 0; i < n; i++)
    {
        printf("%d \n", *(p+i));
    }
}
void max(int *p, int n) {
    int max = *p;
    for (int i = 0; i < n; i++) {
        if (*(p+i) > max) {
            max = *(p+i);
        }
    }
    printf("Giá trị lớn nhất là %d\n", max);
}
void sort(int *p, int n) {

}
bool;
int main () {
    int n, a;
    int *p = &a ;
    do
    {
        printf("Nhập số phần tử (n>0): ");
        scanf("%d", &n);
    } while (n<0);
    p = (int *)malloc(n * sizeof(int));
    if (p == NULL) {
        printf("Không đủ bộ nhớ!\n");
        return 1;
    }
    inputArray(p, n);
    outArray(p, n);
    max(p, n);
    free(p);
}