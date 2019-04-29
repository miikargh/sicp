;; Pascal's triangle

(define (pascal row col)
  (if (or (= row col) (= col 0) (= row 0))
      1
      (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col))))


(pascal 0 0)
(pascal 1 0)
(pascal 1 1)
(pascal 2 0)
(pascal 2 1)
(pascal 2 2)
(pascal 3 0)
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)
(pascal 4 0)
(pascal 4 1)
(pascal 4 2)
(pascal 4 3)
(pascal 4 4)

