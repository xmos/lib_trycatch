// Copyright (c) 2016, XMOS Ltd, All rights reserved

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

