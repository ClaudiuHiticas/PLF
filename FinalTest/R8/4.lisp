(defun remov(l p n)
    (cond
        ((null l) nil)
        ((= (mod p n) 0) (remov (cdr l) (+ p 1) n))
        (T (cons (car l) (remov (cdr l) (+ p 1) n)))
    )
)

(print (remov '(1 2 3 4 5) 1 2))