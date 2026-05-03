#include <stdio.h>
#include <stdlib.h>

struct player
{
    char playerID[10];
    char playerName[30];
    int day, month, year;
    struct player *next;    
};

void inputInfo(struct player pl[]) {
    getchar();
    for (int i = 0; i < sizeof(struct player); i++)
    {
        printf("Tên cầu thủ: "); fgets(pl[i].playerName,sizeof(pl[i].playerName), stdin);
    }
    
}

int main() {
    struct player *head = NULL;
    struct player *p = (struct player *)malloc(sizeof(struct player));
}

