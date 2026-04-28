#include <stdio.h>
#include <math.h>
#define PI 3.14

int main() {
    int radius;
    printf("Nhập bán kính đường tròn: ");
    scanf("%d", &radius);
    printf("Chu vi đường tròn: %.1f\n", 2*PI*radius);
    printf("Diện tích hình tròn: %.1f\n", PI*pow(radius,2));
}