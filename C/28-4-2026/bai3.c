#include <stdio.h>
#include <stdlib.h>

struct player
{
    char playerID[10];
    char playerName[30];
    int day, month, year;
    struct player *next;    
};
struct player *head = NULL;
struct player *tail = NULL;

void inputInfo(int n) {
    for (int i = 0; i < n; i++)
    {
        struct player *p = (struct player *)malloc(sizeof(struct player));
        printf("Nhập ID: "); scanf("%9s", p->playerID);
        getchar();
        printf("Nhập tên cầu thủ: ");
        fgets(p->playerName, sizeof(p->playerName), stdin);
        printf("Nhập ngày tháng năm sinh: "); scanf("%d %d %d", &p->day, &p->month, &p->year);
        getchar();
        p->next = NULL;
        if (head==NULL) {
            head = p;
            tail = p;
        } else {
            tail->next = p;
            tail = p;
        }
    }
}

void exportList() {
    struct player *cur = head;
    while (cur != NULL) {
        printf("\nID: %s\n", cur->playerID);
        printf("Tên cầu thủ: %s\n", cur->playerName);
        printf("Ngày tháng năm sinh: %d-%d-%d\n", cur->day, cur->month, cur->year);
        printf("-------------------\n");
        cur = cur->next;
    }
}

void findLowest() {
    struct player *min = head;
    struct player *cur = head;
    while (cur != NULL) {
        if (cur->year > min->year) {
            min = cur;
        } else if (cur->year == min->year) {
            if (cur->month > min->month) {
                min = cur;
            } else if (cur->month == min->month) {
                if (cur->day > min->day) {
                    min = cur;
                }
            }
        }
        cur = cur->next;
    }
    printf("Cầu thủ nhỏ tuổi nhất:\n");
    printf("ID: %s\n", min->playerID);
    printf("Tên: %s\n", min->playerName);
    printf("Ngày sinh: %d/%d/%d\n", min->day, min->month, min->year);
}

int main() {
    int n;
    printf("Nhập số cầu thủ: "); scanf("%d", &n);
    inputInfo(n);
    exportList();
    findLowest();
}

