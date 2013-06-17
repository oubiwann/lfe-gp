###################
Genetic Programming
###################

*In Lisp Flavored Erlang*


Introduction
============

The first work done for this repo is a port of the `Common Lisp blog post`_
done by Erik Winkels in 2011.


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


Run the unit tests (which will compile everything) to make sure everything's
running as expected:

.. code:: bash

    $ cd lfe-gp
    $ make check

And start playing!


Usage
=====

TBD

.. Links
.. -----
.. _Common Lisp blog post: http://aerique.blogspot.com/2011/01/baby-steps-into-genetic-programming.html
.. _rebar: https://github.com/rebar/rebar
.. _LFE: https://github.com/rvirding/lfe
.. _lfeunit: https://github.com/lfe/lfeunit
