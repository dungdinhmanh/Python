#include <stdio.h>

int day;
int main () {
    printf("Nhập ngày trong khoảng 2-8: ");
    scanf("%d", &day);
    switch (day)
    {
    case 2:
        printf("Thứ hai\n");
        break;
    case 3:
        printf("Thứ ba\n");
        break;
    case 4:
        printf("Thứ tư\n");
        break;
    case 5:
        printf("Thứ năm\n");
        break;
    case 6:
        printf("Thứ sáu\n");
        break;
    case 7:
        printf("Thứ bảy\n");
        break;
    case 8:
        printf("Chủ nhật\n");
        break;
    default:
        printf("Sai, nhập lại\n");
        break;
    }
}