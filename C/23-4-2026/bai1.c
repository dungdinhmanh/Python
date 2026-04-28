#include <stdio.h>
#include <string.h>
struct customer {
  char name[50];
  char address[100];
  struct ChiSo {
    int old_index;
    int new_index;
  } index;
  struct tien {
    float inControl, outControl, sum;
  } money;
};

void listCustomer(struct customer kh[], int n) {
  getchar();
  for (int i = 0; i < n; i++) {
    printf("Tên khách hàng: ");
    fgets(kh[i].name, sizeof (kh[i].name), stdin);
    kh[i].name[strcspn(kh[i].name, "\n")]='\0';
    printf("Địa chỉ: ");
    fgets(kh[i].address, sizeof (kh[i].address), stdin);
    kh[i].address[strcspn(kh[i].address, "\n")]='\0';
    printf("Chỉ số cũ: ");
    scanf("%d", &kh[i].index.old_index);
    printf("Chỉ số mới: ");
    scanf("%d", &kh[i].index.new_index);
    getchar();
  }
}

void calculate(struct customer kh[], int n) {
  for (int i = 0; i < n; i++)
  {
    
  }
  
}

int main() {
  
}
