xCORE trycatch Library
======================

Overview
--------

A library providing a way to handle hardware and software exceptions.

The normal mechanism is to trap an exception in a halt-trap-handler,
awaiting external intervention.
This library handles the trap by unwinding the stack, to the most
recently registered trycatch block, where upon the catch clause is executed.

N.B. trycatch can not be used to implement commit-rollback semantics.
Resources are not returned to their pre-try-state.
The user is required to handle exception safety of global memory and other
resources.

Features
........

  * Catches hardware and software generated traps/exceptions
  * User may throw soft-exceptions.
  * Trycatch blocks may be nested.

Limitations
...........

  * xCORE resources allocated inside the trycatch block may not be freed if a
    hardware exception is raised.
  * If a hardware exception is raised the values of local variables changed
    inside the trycatch block are indeterminate.
  * If the code inside the trycatch block spawns task onto additional logical
    cores, exceptions on these logical cores will not be caught.

Software version and dependencies
.................................

.. libdeps::
