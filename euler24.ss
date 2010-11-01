#lang scheme
(require srfi/1)
(define (repeat f x i)
  (cond
    [(< 1 i) (f (repeat f x (- i 1)))]
    [(= 1 i) (f x)]
    [#t x]))

(define (permute2 objects)
  (let ([robjects (reverse objects)])
    (if ( 2 . >= . (length objects))
        robjects
        (let
            ([i (+ 1 (list-index (lambda (last curr) (last . > . curr))
                            (reverse (cdr objects)) (cdr robjects)))])
          (if (number? i)
              (let
                  ([j (list-index (lambda (x) (x . > . (list-ref robjects i)))
                                  robjects)])
                (reverse (flatten (cons (cdr (member (list-ref robjects (+ i 0))
                                                (map (lambda (x) (if (x . eq? . (list-ref robjects j)) (list-ref robjects i) x)) objects)))
                                        (cons (list-ref robjects j)
                                              (cdr (member (list-ref robjects i) robjects)))))))
                robjects)))))