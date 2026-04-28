#include <stdio.h>

int a,b;
int main () {
    printf("Nhập a, b: ");
    scanf("%d %d", &a, &b);
    if (a != 0) {
        printf("Biểu thức ax + b = 0 có 1 nghiệm x = %d\n", -b/a);
    } else {
        if (b == 0) {
            printf("Biểu thức có vô số nghiệm\n");
        } else {
            printf("Biểu thức vô nghiệm\n");
    }
  }
}
