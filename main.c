#include <stdio.h>
#include <stdlib.h>

int function1(int arg) {
    return arg + arg;
}

int function2(int arg) {
    return arg * arg;
}

int main(void) {
    int value = 10;
    int result = function1(value);

    printf("\n### Coverage TESTS\n\n");
    printf("value:\t%d\nresult:\t%d\n", value, result);

    return EXIT_SUCCESS;
}