;4
;a) Write a function to return the sum of two vectors.

(defun sum(a b c)
    (cond 
        ((and (null a) (null b)) nil)
        (T (sum (cdr a) (cdr b) (+ (car a) (car b))))
    )
)

(print (sum '(1 2 3 4) '(5 6 7 8)))
