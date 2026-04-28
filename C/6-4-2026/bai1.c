#include <stdio.h>
#include <string.h>

char name[30], class[5];
int main () {
    float m1, m2, m3;
    printf("Nhập tên: ");
    fgets(name, sizeof(name), stdin); name[strcspn(name, "\n")] = 0;
    printf("Nhập lớp: ");
    fgets(class, sizeof(class), stdin); class[strcspn(class, "\n")] = 0;
    printf("Nhập điểm: ");
    scanf("%f %f %f", &m1, &m2, &m3);
    float avg = (m1 + m2 + m3)/3;
    if (avg < 5) {
        printf("Học lực yếu\n");
    } else if (avg >= 5 && avg < 6.5f) {
        printf("Học lực trung bình\n");
    } else if (avg >= 6.5f && avg <8) {
        printf("Học lực khá\n");
    } else { printf("Học lực giỏi\n"); }

}