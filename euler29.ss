#lang scheme
(define ht (make-hash))
(define (iterb b a)
  (if (< b 2)
  #t
  (and (hash-set! ht (expt a b) 1) (iterb (- b 1) a))))
(define (itera a b)
  (if (< a 2)
  #t
  (and (iterb b a) (itera (- a 1) b))))