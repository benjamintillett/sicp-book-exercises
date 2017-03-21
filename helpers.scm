;; Very naive implementation of get-type due to very little knowlage of schemes type system
(define (get-type x)
    (cond ((number? x) "Number")
          ((pair? x) "Pair")
          ((string? x) "String")
          ((list? x) "List") 
          ((word? x) "Word")))
