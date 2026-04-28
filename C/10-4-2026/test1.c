#include <stdio.h>

int month, year, nhuan;
int odd = 30, even = 31;
int feb = 28;
int main () {
    printf("Nhập tháng và năm: ");
    scanf("%d %d", &month, &year);
    if ((year % 400) == 0) {
        feb += 1;
    }
    switch (month)
    {
    case 1:
        printf("Tháng %d có %d ngày\n", month, even);
        break;
    case 2:
        printf("Tháng %d có %d ngày\n", month, feb);
        break;
    case 3:
        printf("Tháng %d có %d ngày\n", month, even);
        break;
    case 4:
        printf("Tháng %d có %d ngày\n", month, odd);
        break;
    case 5:
        printf("Tháng %d có %d ngày\n", month, even);
        break;
    case 6:
        printf("Tháng %d có %d ngày\n", month, odd);
        break;
    case 7:
        printf("Tháng %d có %d ngày\n", month, even);
        break;
    case 8:
        printf("Tháng %d có %d ngày\n", month, even);
        break;
    case 9:
        printf("Tháng %d có %d ngày\n", month, odd);
        break;
    case 10:
        printf("Tháng %d có %d ngày\n", month, even);
        break;
    case 11:
        printf("Tháng %d có %d ngày\n", month, odd);
        break;
    case 12:
        printf("Tháng %d có %d ngày\n", month, even);
        break;
    default: 
        printf("Nhập sai tháng\n");
        break;
    }
}