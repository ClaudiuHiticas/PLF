(defun f(l)
    (cond
        ((atom l) -1)
        ((> (f(car l)) 0) (+ (car l) (f(car l)) (f(cdr l))))
        (t (f(cdr l)))
    )
)
;F always return -1

(defun h(l)
    (cond
        (t -1)
    )
)

(print (h '(2 3 4 5 6 7 8 9)))