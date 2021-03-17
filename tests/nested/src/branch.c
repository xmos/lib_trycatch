// Copyright 2016-2021 XMOS LIMITED.
// This Software is subject to the terms of the XMOS Public Licence: Version 1.

#include "test.h"
#include "debug_print.h"

int branch(int v) {
  int ret = twig(v);
  debug_printf("Unexpected success\n");
  return ret;
}
