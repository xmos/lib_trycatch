xCORE trycatch Library
======================

Overview
--------

A library providing a way to handle hardware and soft exceptions.

By default, exception are caught in a trap handler that halts, awaiting
external intervention.
This library handles exceptions by unwinding the stack, to the most
recently registered trycatch block, where upon the catch clause is executed.

N.B. trycatch can not be used to implement commit-rollback semantics.
Resources are not returned to their pre-try-state.
The user is required to handle exception safety of global memory and other
resources.

Features
........

  * Catches hardware and soft generated exceptions
  * User may throw soft exceptions.
  * Trycatch blocks may be nested.

Limitations
...........

  * xCORE resources allocated inside the trycatch block may not be freed if an
    exception is raised.
  * If an exception is raised the values of local variables changed
    inside the trycatch block are indeterminate.
  * If the code inside the trycatch block spawns task onto additional logical
    cores, exceptions on these logical cores will not be caught.
  * The compiler may remove code that has no other side effects beyond
    raising an exception.

Software version and dependencies
.................................

.. libdeps::
