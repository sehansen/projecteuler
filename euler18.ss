#lang scheme
(define (spiralpos x)
  (if (< x 1)
      1
      (+
       (- (* 4 (expt (+ 1 (* 2 x)) 2)) (* 6 2 x))
       (spiralpos (- x 1)))))