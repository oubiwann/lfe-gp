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

; given no operators, use default values for generating a population of LFE
; forms for use in a GP run
(defun create-initial-population ()
  (create-initial-population (+operators+) (+population-size+)))

; given a starting size, generate a population of LFE forms for use in a GP run
(defun create-initial-population (size)
  (create-initial-population (+operators+) size))

; given a list of operators and a starting size, generate a population of LFE
; forms for use in a GP run
(defun create-initial-population (operators size)
  (let ((initial-data (cons (random-form operators) ())))
    (accumulate-forms initial-data 0 size)))

; given a list of forms, the current number of forms, and the maximum number of
; forms, return a new list of forms that is a combination of the old list of
; forms and a newly generated form
(defun accumulate-forms (forms count limit)
  (cond ((== count (- limit 1)) forms)
        ('true
          (let* ((new-form (random-form (+operators+)))
                 (new-forms (cons new-form forms)))
            (accumulate-forms new-forms (+ count 1) limit)))))
