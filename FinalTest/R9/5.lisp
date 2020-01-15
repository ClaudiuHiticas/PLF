(defun transform(l)
    (cond
        ((null l) nil)
        ((numberp l) (list l))
        ((atom l) (list l))
        (t (apply 'append (mapcar 'transform l)))
    )
)

(defun check(l)
    (setq l (transform l))
    (cond
        ((and (null (cdr l)) (not (numberp (car l)))) 1)
        ((null (cdr l)) 0)
        (t (check (cdr l)))
    )
)

(defun solve(l)
    (cond
        ((atom l) 0)
        (T (+ (check l) (apply '+ (mapcar 'solve l))))
    )
)

(write (transform '(A (B 1) (1 C 4) 7 (D 1 (6 F)) ((G 4) 6) F)))
