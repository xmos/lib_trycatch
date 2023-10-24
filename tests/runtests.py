#!/usr/bin/env python
# Copyright 2016-2021 XMOS LIMITED.
# This Software is subject to the terms of the XMOS Public Licence: Version 1.
import xmostest

if __name__ == "__main__":
    xmostest.init()

    xmostest.register_group("lib_trycatch",
                            "trycatch_tests",
                            "Tests of the xCORE trycatch library",
    """ Tests of the xCORE trycatch library.
    """)

    xmostest.runtests()

    xmostest.finish()
