#include <stdio.h>
#include <time.h>

int born;
int main () {
    printf("Type born year: ");
    scanf("%d", &born);
    time_t now = time(NULL);
    struct tm *t = localtime(&now);
    int age = (t->tm_year + 1900) - born;
    printf("Ages: %d\n", age);
}