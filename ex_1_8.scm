
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess))
        guess)
     0.0000001))

(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x) x)))

(cubert-iter 1.0 25.0)
