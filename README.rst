##########
git-review
##########

Code Review Helper on CLI
#########################

:Manual section: 1
:Date: 2022-07-25
:Author: Jan Matějka jan@matejka.ninja
:Manual group: git-review manual

Synopsis
========

git review [<rev>]

Description
===========

Given a revision range, git review will display each revision in the range in order in `less`.

Example: ``git review master..feature`` will display the additional revisions from feature branch,
one by one. To go to the next revision, close the pager, typically with ``q``. To terminate
git-review hit Ctrl-C repeatedly.

Given no arguments, git-review will find the currently checked out branch and effectively do
``git review master..<branch>``.

This is useful for reviewing commits one by one on the command line.

Environment Variables
=====================

GIT_REVIEW_SHOW_CMD
  Command used to display a single revision.
  Defaults to ``git show --color=always``.

GIT_REVIEW_TARGET
  The branch to compare HEAD branch to if no arguments are given.
  Defaults to ``master``.

Installation
============

Standard:

.. code-block:: shell

   # make install


Install into user's home directory:

.. code-block:: shell

   $ make install-home

Dependencies
============

- zsh
- findutils (xargs)
- less
- git


Diagnostics
===========

The program exits 0 on success, and >0 if an error occurs.

License
=======

BSD-3 https://github.com/yaccz/git-review/blob/master/LICENSE

Bugs
====

No doubt plentiful.

Please report them at
https://github.com/yaccz/git-review/issues
