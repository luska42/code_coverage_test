#include <stdio.h>
#include <stdlib.h>

// Cmocka includes
#include <stdint.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>

#include "cmocka.h"

/* tests */

void test_do_something_failure(void **state)
{
    (void) state; /* unused */
    //int a = 4;
    int a = 2;

    assert_int_equal(4, a); // São diferentes
}

void test_do_something_success(void **state)
{
    (void) state; /* unused */
    int a = 2;

    assert_int_equal(2, a); // São iguais
}


const struct CMUnitTest do_something_tests[] = {
    cmocka_unit_test(test_do_something_failure),
    cmocka_unit_test(test_do_something_success),
};

int main(void) {
    return cmocka_run_group_tests(do_something_tests, NULL, NULL);
}