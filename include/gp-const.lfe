; operators to use for generating functions
(defmacro *operators* _ `'(+ - * /))
; operator arity
(defmacro *arity* _ `2)
; probability that a type will be chosen
(defmacro *number-chance* _ `0.75)
(defmacro *form-chance* _ `0.5)
(defmacro *input-chance* _ `0.25)
(defmacro *number-range* _ `10)
