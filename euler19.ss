#lang scheme
(define lastday (+ (* 365 100) 25))
(define (isSunday day)
  (if (and 
       [(modulo day 7) . equal? . 0] 
       [day . < . lastday])
      #t
      #f))

(define (month-length month year)
  (cond 
    [(member month (list 3 5 8 10)) 30]
    [(month . equal? . 1) (if (or [and
                                   [equal? (modulo year 4) 0]
                                   [not (equal? (modulo year 100) 0)]]
                                  [(modulo year 400) . equal? . 0])
                              29
                              28)]
    [else 31]))

(define (month-sum month year)
  ;  (print (list month year))
  (if (and 
       [year . < . 2001]
       [year . >= . 1901])
      (+ (month-length month year) (month-sum 
                                    (modulo (- month 1) 12)
                                    (- year (if ((- month 1) . < . 0) 1 0))))
      0) )

(require srfi/42)
(apply + (map (lambda (month)
                (if (isSunday (+ 2 (month-sum
                                    (modulo month 12)
                                    (+ 1901 (floor (/ month 12))))))
                    1
                    0))
              (list-ec (: i 1199) i)))