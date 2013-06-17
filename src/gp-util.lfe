(defmodule gp-util
  (export all)
  (import
    (rename lists ((nth 2) nth))
    (rename erlang ((length 1) length))
    (rename random ((uniform 0) random))
    (rename random ((uniform 1) random-int)))
  (import
    (from gp-const
      (+form-chance+ 0)
      (+number-chance+ 0)
      (+number-range+ 0)
      (+operators+ 0)
      )))

(defun random-nth (seq)
  "
  Get the a random element from a given sequence.
  "
  (nth (random-int (length seq)) seq))

(defun random-element (operators)
  "
  Given a list of operators, return an element of a form, potentially composed
  of other forms.
  "
  (let ((dice-roll (random)))
    (cond ((< dice-roll (+form-chance+)) (random-form operators))
          ((< dice-roll (+number-chance+)) (random-int (+number-range+)))
          ('true '=input=))))

(defun random-form (operators)
  "
  Given a list of operators, return a randomly-generated form.
  "
  (list (random-nth operators)
        (random-element operators)
        (random-element operators)))

(defun run-form (form input)
  "
  Given a generated form and input value, comput the output value
  If there is an error evaluating the generated code, print a message to stdout
  and return an empty list.
  "
  ; For example, from the REPL:
  ;   > (c '"gp-util")
  ;   #(module gp-util)
  ;   > (: gp-util run-form (: gp-util test-form) 2)
  ;   78.4
  (try
    (gp-util--run-form form input)
    (catch ((tuple error-class error-type stack-trace)
            (: io format '"INFO: Form could not be evaluated: {~p: ~p}.~n"
               (list error-class error-type))
            ()))))

(defun gp-util--run-form (form input)
  "
  This 'private' function does the real work of evaluating a generated form.
  "
    (funcall (eval `(lambda (=input=) ,form))
             input))

(defun test-form ()
  "
  Convenience function for testing in the LFE REPL.
  "
  (random-form (+operators+)))

(defun test-run-form ()
  "
  Convenience function for testing in the LFE REPL.
  "
  (run-form (test-form) (random-int 100)))
