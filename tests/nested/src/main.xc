// Copyright 2016-2021 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

#include "trycatch.h"
#include "debug_print.h"
#include "test.h"

int main() {
  exception_t exception;
  TRY {
    branch(0);
    debug_printf("Unexpected success\n");
  }
  CATCH (exception) {
    if (exception.type == myET && exception.data == myED)
      debug_printf("Caught myET & myED\n");
    else
      debug_printf("Unexpected exception: type=%d data=%d\n",
                    exception.type, exception.data);
  }
  return 0;
}

