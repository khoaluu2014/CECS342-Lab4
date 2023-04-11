#lang scheme
;1
(define log2
  (lambda (n)
    (letrec ([helper (lambda (n s) (if (= n 1) s (helper (quotient (+ n 1) 2) (+ s 1))))])
      (helper n 0))))

(display (log2 8))
(display "\n")

;2
(define filter
  (lambda (f L)
    ; return list of those elements in L which pass through filter f
    (if (null? L) L (if (f (car L)) (cons (car L) (filter f (cdr L))) (filter f (cdr L))))))

(display (filter (lambda (num) (< num 5)) '(3 9 5 8 2 4 7)))

