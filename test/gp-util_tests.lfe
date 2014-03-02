(defmodule gp-util_tests
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
    (from gp-util
      (random-nth 1)
      (random-element 1)
      (random-form 1))))

(defun random-nth_test ()
  (let* ((givens (list 1 2 3 4 5 6 7 8 9 10))
         (pick-one (random-nth givens))
         (in-givens (: lists member pick-one givens)))
    (assert `',in-givens)))