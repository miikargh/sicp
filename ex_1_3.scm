(define
  (sum-of-squares-of-two-largest x y z)
  (let ((a (max x y))
        (b (max y z)))
    (+ (* a a) (* b b))))

(sum-of-squares-of-two-largest 1 2 3)
