#include <stdio.h>

int N;
int main () {
    do
    {
        printf("Nhập số nguyên dương N: ");
        scanf("%d", &N);
    } while (N > 100 && N < 0);
    int a[N];
    for (int i = 0; i < N; i++) {
        printf("Nhập phần tử thứ %d: ", i+1);
        scanf("%d", &a[i]);
    }
    int choice = 0;
    printf("Chọn 1 mục dưới đây (1/2/3)\n");
    printf("1. Xuất dãy vừa nhập\n"
        "2. Đếm số phần tử chẵn và tính tổng phần tử lẻ\n"
        "3. Thoát chương trình\n"
    );
    scanf("%d", &choice);
    switch (choice)
    {
    case 1:
        printf("\nDãy vừa nhập: "); 
        for (int i = 0; i < N; i++)
        {
            printf("%d ", a[i]);
        }
        break;
    case 2:
        int count = 0, sum_even;
        for (int i = 0; i < N; i++) {
            if (a[i] % 2 == 0) {
                count++;
            } else sum_even+= a[i];
        }
        printf("\nCó %d phần tử chẵn và tổng các phần tử lẻ là %d\n", count, sum_even);
        break;
    default: 
        printf("Thoát chương trình\n");
        break;
    }
}