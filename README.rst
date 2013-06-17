###########################################
Genetic Programming in Lisp Flavored Erlang
###########################################

Introduction
============

The first work done for this repo is a port of the Common Lisp blog post done
by Erik Winkels in 2011:
  http://aerique.blogspot.com/2011/01/baby-steps-into-genetic-programming.html


Dependencies
------------

This project assumes that you have `rebar`_ installed somwhere in your
``$PATH``.

This project depends upon the following, which installed to the ``deps``
directory of this project when you run ``make deps``:

* `LFE`_ (Lisp Flavored Erlang; needed only to compile)
* `lfeunit`_ (needed only to run the unit tests)


Installation
============

Get the code from Github:
.. code:: bash

    $ git clone git@github.com:lfe/lfe-gp.git


Compile everything:
.. code:: bash

    $ make
    $ 

Usage
=====

TBD

.. Links
.. -----
.. _rebar: https://github.com/rebar/rebar
.. _LFE: https://github.com/rvirding/lfe
.. _lfeunit: https://github.com/lfe/lfeunit
