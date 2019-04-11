(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))


(define (square x) (* x x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x) x)))

(sqrt-iter 1.0 2.0)

;; How the sqrt-iter procedure is run with new-if

;; (sqrt-iter 1.0 2.0)

;; ;; =>
;; (new-if (good-enough? 1.0 2.0)
;;         1.0
;;         (sqrt-iter (improve 1.0 2.0) 2.0))

;; ;; =>
;; (new-if (good-enough? 1.0 2.0)
;;         1.0
;;         (sqrt-iter (average guess (/ 2.0 1.0)) 2.0))
;; ;; =>
;; (new-if (good-enough? 1.0 2.0)
;;         1.0
;;         (sqrt-iter (/ (+ 1.0 (/ 2.0 1.0))) 2.0))

;; ;; =>
;; (new-if (good-enough? 1.0 2.0)
;;         1.0
;;         (sqrt-iter 0.3333 2.0))

;; ;; =>
;; (new-if (good-enough? 1.0 2.0)
;;         1.0
;;         (new-if (good-enough? 0.3333 2.0)
;;                 0.3333
;;                 (sqrt-iter (improve 0.3333 2.0) 2.0)))

;; ...and so on.
;; So good-enough? never gets evaluated and the recursion reaches maximum depth.
;; This is becausethe interpreter follows applicative substitution and only evaluates one of the new-if's parameter at a time, not both.
