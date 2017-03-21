(load "./helpers")

; An assertion contains lamda that returns a boolean.
; Such that the lamda is executed within the body of the test funciton.
; allowing the assertion to provide custom logging for the test.

(define (assert-true assertion)
   (lambda () assertion))

(define (assert-false assertion)
  (lambda () (not assertion)))

(define (assert-equals a b)

  (define (both-numbers?)
    (and (number? a) (number? b)))

  (define (both-words?)
    (and (word? a) (word? b)))

  (define (both-strings?)
    (and (string? a) (string? b))) 

  (define (both-lists?)
    (and (list? a) (list? b)))
  
  (lambda ()
    (display "\n  EXPECTED: ")
    (display a)
    (display "\n  ACTUAL: ")
    (display b)
    (cond
     ((both-numbers?)
      (= a b))
     ((or both-words? both-lists? both-strings?)
      (equal? a b))
     (else #f))))

(define (test text assertion)
  (display (word "\nTEST: " text))
  (if (assertion)
      (display "\n    PASS")
      (display "\n    FAIL"))
  (newline))
