// Copyright (c) 2016, XMOS Ltd, All rights reserved

#include "test.h"
#include "debug_print.h"

int branch(int v) {
  int ret = twig(v);
  debug_printf("Unexpected success\n");
  return ret;
}
