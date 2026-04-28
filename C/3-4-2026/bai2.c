#include <stdio.h>
#include <ctype.h>

char character;
int main () {
    printf("Nhập kí tự: ");
    scanf("%c", &character);
    if (isupper(character) > 1)
    {
        printf("%c\n", tolower(character));
    } else
    {
        printf("%c\n", toupper(character));
    }
}
