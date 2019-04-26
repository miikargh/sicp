(define (f-recur n)
  (if (< n 3)
      n
      (+ (f-recur (- n 1))
         (* 2 (f-recur (- n 2)))
         (* 3 (f-recur (- n 3))))))


(f-recur 15)

(define (f-iter n)
  (define (iter n-1 n-2 n-3 i)

    (display "\n")
    (display "n-1: ")
    (display n-1)
    (display "\nn-2: ")
    (display n-2)
    (display "\nn-3: ")
    (display n-3)
    (display "\ni: ")
    (display i)
    (display "\n")

    (if (= n i)
        n-1
        (iter n-2 n-3 (+ n-3 (* 2 n-2) (* 3 n-1)) (+ 1 i))))
  (if (< n 3)
      n
      (iter 0 1 2 0)))

(f-iter 15)
