// Copyright 2016-2021 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

#include <xs1.h>
#include "trycatch.h"
#include "debug_print.h"
#include "test.h"

int twig(int v) {
  exception_t exception;
  TRY {
    leaf(v);
    debug_printf("Unexpected success\n");
  }
  CATCH (exception) {
    if (exception.type == XS1_ET_ARITHMETIC) {
      debug_printf("Divide by zero caught\n");
      exception_t e = {myET, myED};
      THROW(e);
    }
    else {
      debug_printf("Unexpected exception: type=%d data=%d\n",
                    exception.type, exception.data);
    }
  }
  return 0;
}

