(defmodule gp-init
  (export all)
  (import
    (from gp-util
      (random-form 1)))
  (import
    (from gp-const
      (+operators+ 0)
      (+population-size+ 0)
      )))

(defun create-initial-population ()
  "
  Given no operators, use default values for generating a population of LFE
  forms for use in a GP run.
  "
  (create-initial-population (+operators+) (+population-size+)))

(defun create-initial-population (size)
  "
  Given a starting size, generate a population of LFE forms for use in a GP
  run.
  "
  (create-initial-population (+operators+) size))

(defun create-initial-population (operators size)
  "
  Given a list of operators and a starting size, generate a population of LFE
  forms for use in a GP run.
  "
  (let ((initial-data (cons (random-form operators) ())))
    (accumulate-forms initial-data 0 size)))

(defun accumulate-forms (forms count limit)
  "
  Given a list of forms, the current number of forms, and the maximum number of
  forms, return a new list of forms that is a combination of the old list of
  forms and a newly generated form.
  "
  (cond ((== count (- limit 1)) forms)
        ('true
          (let* ((new-form (random-form (+operators+)))
                 (new-forms (cons new-form forms)))
            (accumulate-forms new-forms (+ count 1) limit)))))
