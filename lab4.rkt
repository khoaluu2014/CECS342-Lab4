#lang scheme
;1
(define log2
(lambda (n)
(letrec
((helper
(lambda (n s)
(if (= n 1) s (helper (quotient (+ n 1) 2) (+ s 1))))))
(helper n 0))))

(display (log2 8))
