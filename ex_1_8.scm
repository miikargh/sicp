
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (abs (* guess 0.001))))

(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x) x)))


(define (cube-root x)
  (cubert-iter 1.0 x))

(cube-root 25.0)
