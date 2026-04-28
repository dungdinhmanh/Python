#include <stdio.h>
#include <math.h>

int a, b, c;
int main() {
    printf("Nhập a, b, c: ");
    scanf("%d %d %d", &a, &b, &c);
    if (a != 0)
    {
        float delta = (pow(b,2)-4*a*c);
        printf("a != 0 nên phương trình nên ta có delta: %.0f\n", delta);
        if (delta > 0) {
            printf("Phương trình có 2 nghiệm phân biệt ");
            float x1 = (-b + sqrt(delta))/(2*a);
            float x2 = (-b - sqrt(delta))/(2*a);
            printf("x1 = %.0f, x2 = %.0f\n", &x1, &x2);
        } else if (delta == 0)
        {
            printf("Phương trình có nghiệm kép ");
            float x = -b/(2*a);
            printf("x1 = x2 = %.0f\n", &x);
        } else if (delta < 0)
        {
            printf("Phương trình vô nghiệm\n");
        }
          
    }
    else
    {
        printf("a = 0 nên phương trình trở thành bậc nhất bx + c = 0\n");
        if (b != 0) {
            printf("Phương trình có nghiệm duy nhất %d\n", -c/b);
        } else if (b == 0 && c == 0)
        {
            printf("Phương trình có vô số nghiệm\n");
        } else if (b == 0 && c != 0)
        {
            printf("Phương trình vô nghiệm\n");
        }
        
        
    }
    
}