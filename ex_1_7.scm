(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (old-good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (old-sqrt-iter guess x)
  (if (old-good-enough? guess x)
      guess
      (old-sqrt-iter (improve guess x) x)))

(old-sqrt-iter 1 0.0005)
;;=> .036405
;; Should be closer to 0.022361
;; This is because the good-enough? test accuracy is 0.001

(define a 999.9)
(define y (* a a a a a a a a a)) ;; a^9
;; (old-sqrt-iter 1 y) ;; Prepare for infinite loop if you uncomment this
;; Results in infinte loop since the maximum accuracy of the computer is reached

;; A Better good-enough?:
(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define x 0.0005)
(display (sqrt-iter 1 x))

(define a 999.9)
(define y (* a a a a a a a a a)) ;; a^9
(sqrt-iter 1 y)
