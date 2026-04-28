#include <stdio.h>

char name[20], phone_number[13];
int distance, cost;
int main () {
    printf("Nhập tên: ");
    scanf("%19s", &name);
    printf("Nhập số điện thoại: ");
    scanf("%11s", &phone_number);
    printf("Nhập số km đã đi: ");
    scanf("%d", &distance);
    if (distance <=1) {
        cost = distance * 15000;
    } else if (distance <= 5)
    {
        cost = 15000 + (distance - 1) * 13500;
    } else if (distance > 5)
    {
        cost = 15000 + 4 * 13500 + (distance - 5) * 11000;
    } 
    if (distance > 120) {
        cost = (int)(cost * 0.9f);
    }
    printf("Số tiền phải trả là %d\n", cost);
    
}