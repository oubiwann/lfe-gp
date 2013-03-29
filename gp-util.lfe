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
    (cond ((< dice-roll (+form-chance+)) (random-form operators))
          ((< dice-roll (+number-chance+)) (random-int (+number-range+)))
          ('true '=input=))))

; given a list of operators, return a randomly-generated form
(defun random-form (operators)
  (list (random-nth operators)
        (random-element operators)
        (random-element operators)))

; given a generated form and input value, comput the output value
; for example, from the REPL:
;   > (c '"gp-util")
;   #(module gp-util)
;   > (: gp-util run-form (: gp-util test-form) 2)
;   78.4
;   >
; If there is an error evaluating the generated code, print a message to stdout
; and return an empty list.
(defun run-form (form input)
  (try
    (funcall (eval `(lambda (=input=) ,form))
             input)
    (catch ((tuple error-class error-type stack-trace)
            (: io format '"INFO: Form could not be evaluated: {~p: ~p}.~n"
               (list error-class error-type))
            ()))))

; convenience function for testing in the LFE REPL
(defun test-form ()
  (random-form (+operators+)))

; convenience function for testing in the LFE REPL
(defun test-run-form ()
  (run-form (test-form) (random-int 100)))
