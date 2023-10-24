// Copyright 2016-2021 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

// xs1.h pulls in 'XS1_ET_' defines.
#include <xs1.h>
#include "trycatch.h"
#include "debug_print.h"

int divide(int dividend, int divisor) {
  return dividend / divisor;
}

int main() {
  exception_t exception;
  TRY {
    int result = divide(42, 0);
    debug_printf("Unexpected success: %d\n", result);
  }
  CATCH (exception) {
    if (exception.type == XS1_ET_ARITHMETIC)
      debug_printf("Divide by zero caught\n");
    else
      debug_printf("Unexpected exception: type=%d data=%d\n",
                    exception.type, exception.data);
  }
  return 0;
}

