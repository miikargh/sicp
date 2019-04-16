(define (dec x) (- x 1))
(define (inc x) (+ x 1))

(define (plus1 a b)
  (if (= a 0)
      b
      (inc (plus1 (dec a) b))))


;; (plus1 4 5)
;; =>
;; (if (= 4 0)
;;     5
;;     (inc (plus1 (dec 4) 5)))
;; =>
;; (inc (plus1 3 5))
;; =>
;; (inc
;;  (if (= 3 0)
;;      5
;;      (inc (plus1 (dec 3) 5))))
;; =>
;; (inc
;;  (inc (plus1 2 5)))
;; =>
;; ...and so on. This is a recursive process,
;; since hidden state is maintained by the interpreter.

(define (plus2 a b)
  (if (= a 0)
      b
      (plus2 (dec a) (inc b))))

(plus2 4 5)
=>
(if (= 4 0)
    5
    (plus2 (dec 4) (inc 5)))
=>
(plus2 3 6)
=>
(if (= 3 0)
    6
    (plus2 (dec 3) (inc 6)))
=>
(plus2 2 6)
=>
;; ... and so on. This is a iterative proccess since all the state of
;; the process is in the variables

