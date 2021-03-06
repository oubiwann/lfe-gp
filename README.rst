###########
lfe-gp
###########

*Genetic Programming in Lisp Flavored Erlang*


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

This will download all the dependencies and compile everything (using
``rebar``).

With that done, you're ready to start playing!


Usage
=====


Warm-ups
--------

Fire up an LFE REPL:

.. code:: bash

    $ make shell-no-deps

Once at the prompt, build a few random forms. You should see something along
the same lines as below (these are randomly generated, so yours will differ):

.. code:: lisp

    > (: gp-util test-form)
    (quote 10 4)
    > (: gp-util test-form)
    ((+ - * /) =input= 5)
    > (: gp-util test-form)
    ((+ - * /)
     (quote 2 3)
     (quote
      ((+ - * /)
       (quote
        (quote 10 (quote (quote =input= =input=) =input=))
        (quote =input= (quote (quote =input= 7) ((+ - * /) =input= =input=))))
       =input=)
      3))

Once you've confirmed that random forms are being generated, you can evaluate
randomly generated forms:

.. code:: lisp

    > (: gp-util test-run-form)

We don't show the output here, but it could be just about anything! (Including
an error message letting you know that the form couldn't be evaluated.)


Populations
-----------

Now that you've got a taste for some of the basics, let's do some work. Here's
the function that sets up a new population for you:

.. code:: lisp

    > (: gp-init create-initial-population)

This output of this could be quite large! If you want to limit the size, try
this:

.. code:: lisp

    > (: gp-init create-initial-population 1)


.. Links
.. -----
.. _Common Lisp blog post: http://aerique.blogspot.com/2011/01/baby-steps-into-genetic-programming.html
.. _rebar: https://github.com/rebar/rebar
.. _LFE: https://github.com/rvirding/lfe
.. _lfeunit: https://github.com/lfe/lfeunit
