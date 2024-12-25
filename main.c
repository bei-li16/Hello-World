#include <stdio.h>
#include "testfunc.h"

int main()
{
    int a = 12;
    int b = 23;
    int ret = AddTest(a, b);
    printf("Add a: %d and b: %d, result ret: %d. \n", a, b, ret);
    printf("Hello World! \n");
    return 0;
}
