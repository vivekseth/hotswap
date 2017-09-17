#include "libtest.h"
#include <stdio.h>

int main(int argc, char const *argv[])
{
    int input = 123;
    int output = test(input);
    printf("test(%d) = %d \n", input, output);
    return 0;
}
