#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main(){
    char a[100];
    char b[100];

    printf("Nhap a: "); fgets(a, sizeof(a), stdin);
    printf("Nhap b:"); fgets(b, sizeof(b), stdin);

    printf("%s\n", a);
    printf("%s\n", b);
}