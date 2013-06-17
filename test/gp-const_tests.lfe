(defmodule gp-const_tests
  (export all)
  (import
    (from lfeunit-util
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))
    (from lfeunit
      (assert 1)
      (assert-not 1)
      (assert-equal 2)
      (assert-not-equal 2)
      (assert-exception 3)
      (assert-error 2)
      (assert-throw 2)
      (assert-exit 2)))
  (import
    (from gp-const
      (+arity+ 0)
      (+form-chance+ 0)
      (+input-chance+ 0)
      (+number-chance+ 0)
      (+number-range+ 0)
      (+operators+ 0)
      (+population-size+ 0))))

(defun arity_test ()
  (assert-equal 2 (+arity+)))

(defun form-chance_test ()
  (assert-equal 0.5 (+form-chance+)))

(defun input-chance_test ()
  (assert-equal 0.25 (+input-chance+)))

(defun number-chance_test ()
  (assert-equal 0.75 (+number-chance+)))

(defun number-range_test ()
  (assert-equal 10 (+number-range+)))

(defun operators_test ()
  (assert-equal '(+ - * /) (+operators+)))

(defun population-size_test ()
  (assert-equal 10 (+population-size+)))