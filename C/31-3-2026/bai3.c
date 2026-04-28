#include <stdio.h>

char product[50];
int count, price;
int main() {
    int sum, tax;
    printf("Sản phẩm: ");
    scanf(" %49s", &product);
    printf("Nhập số lượng: \n");
    scanf("%d", &count);
    printf("Nhập đơn giá: \n");
    scanf("%d", &price);
    printf("Thành tiền: %d\n", sum = count * price);
    printf("Thuế: %d\n", tax = (int)(sum * 0.1f));
}