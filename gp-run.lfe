(defmodule gp-run
  (export all)
  (import (from gp-util (random-form 1))))

; include the constants
(include-file "include/gp-const.lfe")

; given an optional list of operators and an optional starting size, generate a
population of LFE forms for use in a GP run
(defun create-initial-population (operators size)
  ; if operators not defined, use constant value; likewise for size
  ;(case ... )
  ; XXX oh, wait -- no, use function arg patterns here instead

  ; CL collector:
  ;(loop repeat size
  ;      collect (random-form operators)))

  ; XXX what's the best way to do the above in LFE? list comprehension?

  ; temp implementation
  (random-form (+operators+)))
