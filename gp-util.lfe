(defmodule gp-util
  (export all)
  (import (rename lists ((nth 2) nth))
          (rename erlang ((length 1) length))
          (rename random ((uniform 0) random))
          (rename random ((uniform 1) random-int))))

; include the constants
(include-file "include/gp-const.lfe")

; get the a random element from a given sequence
(defun random-nth (seq)
  (nth (random-int (length seq)) seq))

; given a list of operators, return an element of a form, potentially composed
; of other forms
(defun random-element (operators)
  (let ((dice-roll (random)))
    (cond ((< dice-roll (*form-chance*)) (random-form operators))
          ((< dice-roll (*number-chance*)) (random-int (*number-range*)))
          ('true '=input=))))

; given a list of operators, return a randomly-generated form
(defun random-form (operators)
  (list (random-nth operators)
        (random-element operators)
        (random-element operators)))

; convenience function for testing in the LFE REPL
(defun test-form ()
  (random-form (*operators*)))

; given a generated form and input value, comput the output value
; for example, from the REPL:
;   > (: gp-util run-form (: gp-util test-form) 2)
;   78.4
;   >
; XXX update this function to catch errors
(defun run-form (form input)
  (funcall (eval `(lambda (=input=) ,form))  ; note: backquote!
           input))
