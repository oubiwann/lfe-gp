(defmodule gp-const
  (export all))

; operators to use for generating functions
(defun +operators+ () `'(+ - * /))

; operator arity
(defun +arity+ () 2)

; probability that a type will be chosen
(defun +number-chance+ () 0.75)
(defun +form-chance+ () 0.5)
(defun +input-chance+ () 0.25)
(defun +number-range+ () 10)

; default initial population size
(defun +population-size+ () 10)