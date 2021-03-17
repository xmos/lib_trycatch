// Copyright 2016-2021 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

#include "trycatch.h"
#include "debug_print.h"

const unsigned myET = 123;
const unsigned myED = 456;

int foo(void) {
  exception_t e = {myET, myED};
  THROW(e);
  // noreturn
}

int main() {
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
  return 0;
}

