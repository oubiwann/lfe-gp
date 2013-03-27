(defmodule gp-util
  (export all)
  (import (rename lists ((nth 2) nth))
          (rename erlang ((length 1) length))
          (rename random ((uniform 0) random))
          (rename random ((uniform 1) random-int))))

(include-file "include/gp-const.lfe")

(defun random-nth (seq)
  (nth (random-int (length seq)) seq))

(defun random-element (operators)
  (let ((dice-roll (random)))
    (cond ((< dice-roll (*form-chance*)) (random-form operators))
          ((< dice-roll (*number-chance*)) (random-int (*number-range*)))
          ('true '=input=))))

(defun random-form (operators)
  (list (random-nth operators)
        (random-element operators)
        (random-element operators)))
