// Copyright 2016-2021 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

// xs1.h pulls in 'XS1_ET_' defines.
#include <xs1.h>
#include "trycatch.h"
#include "debug_print.h"

const unsigned myET = 123;
const unsigned myED = 456;

int foo(void) {
  exception_t e = {myET, myED};
  THROW(e);
 return 0;
}

int divide(int dividend, int divisor) {
  return dividend / divisor;
}

void catch_foo(void) {
  exception_t exception;
  TRY {
    foo();
    debug_printf("Unexpected success\n");
  }
  CATCH (exception) {
    if (exception.type == myET && exception.data == myED)
      debug_printf("Caught myET & myED\n");
    else
      debug_printf("Unexpected exception: type=%d data=%d\n",
                    exception.type, exception.data);
  }
}

void uncaught_divide(void) {
  // Allow time for the other cores to complete.
  int time;
  timer tmr;
  tmr :> time;
  tmr when timerafter(time+10000) :> void;

  int result = divide(42, 0);
  debug_printf("Unexpected success: %d\n", result);
}

int main() {
  exception_t exception;
  TRY {
    par {
      uncaught_divide();
      catch_foo();
      catch_foo();
    }
    debug_printf("Unexpected success\n");
  }
  CATCH (exception) {
      debug_printf("Unexpected exception: type=%d data=%d\n",
                    exception.type, exception.data);
      debug_printf("The child task originating the exception just"
                   " happened to be run on the parent core who caught it.\n");
  }
  return 0;
}


