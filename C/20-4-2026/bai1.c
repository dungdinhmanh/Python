#include <stdio.h>

int n;
void input_array(int a[], int n) {
    
    for (int i = 0; i < n; i++)
    {
        printf("Nhập phần tử thứ %d: ", i+1);
        scanf("%d", &a[i]);
    }
}
void exportArray(int a[], int n) {
    printf("Các số vừa nhập là: ");
        for (int i = 0; i < n; i++)
        {
            printf("%d ", a[i]);
        }
}
void max_cmp(int a[], int n) {
    int max = 0;
        for (int i = 0; i < n; i++)
        {
            if (max < a[i]) {
                max = a[i];
            }
        }
        printf("Phần tử lớn nhất là %d", max);
}
void sort(int a[], int n) {
    printf("Mảng sau khi sắp xếp: ");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n-1; j++)
            {
                if (a[j] > a[j+1]) {
                int tmp = a[j];
                a[j] = a[j+1];
                a[j+1] = tmp ;  
                }
            }
        }
        for (int i = 0; i < n; i++)
        {
            printf("%d ", a[i]);
        }
}
void sum_odd_even(int a[], int n) {
    int sum_odd, sum_even;
        for (int i = 0; i < n; i++)
        {
            if (a[i]% 2 == 0) {
                sum_odd += a[i];
            } else sum_even += a[i];
        }
        printf("Tổng chẵn là %d, tổng lẻ là %d\n", sum_odd, sum_even);
}
void menu(int a[], int n, int choice) {
    switch (choice)
    {
    case 1:
        exportArray(a, n);
        break;
    case 2:
        max_cmp(a, n);
        break;
    case 3:
        sort(a, n);
        break;
    case 4:
        for (int i = 0; i < n; i++)
        {
            
        }
        
        break;
    case 5:
        sum_odd_even(a, n);
        break;
    case 6:
    
        break;
    default:
        break;
    }
}
int main() {
    do
    {
        printf("Nhập số phần tử trong mảng: ");
        scanf("%d", &n);
    } while (n<0);
    int a[n], choice;
    input_array(a,n);
    printf("      MENU"
    "\n1. Xuất mảng vừa nhập"
    "\n2. Tìm phần tử lớn nhất"
    "\n3. Sắp xếp mảng tăng dần"
    "\n4. In ra phần tử là nguyên tố"
    "\n5. Tính tổng các phần tử chẵn/lẻ của mảng"
    "\n6. Đếm số phần tử = x (x nhập từ bàn phím)"
    );
    printf("\nNhập lựa chọn: ");
    scanf("%d", &choice);
    menu(a, n, choice);
}
