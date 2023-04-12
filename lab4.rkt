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
(display "\n")
;3

(define rotations
  (lambda (L)
    (letrec ([helper
              (lambda (Ls A B)
                (if (null? B)
                    Ls
                    (helper (append Ls (list (append B A))) (append A (list (car B))) (cdr B))))])
      (helper '() '() L))))
(display (rotations '(a b c d e)))
(display "\n")

(require scheme/mpair)
(require r5rs)
(define-syntax while
  (syntax-rules ()
    [(while cond body ...)
     (let start_loop ()
       (if cond
           (begin
             body ...
             (start_loop))
           #f))]))

(define unique2
  (lambda (L)
    (if (null? L)
        L
        (let ([A L] [B (cdr L)])
          (while (not (null? B))
                 (if (eqv? (car A) (car B)) (set-cdr! A (cdr B)) (set! A (cdr A)))
                 (set! B (cdr B)))
          L))))

(unique2 '(1 2 2 3 3 3 4 5 5 6 6 6 6))
