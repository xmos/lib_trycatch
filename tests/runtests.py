#!/usr/bin/env python2.7
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
