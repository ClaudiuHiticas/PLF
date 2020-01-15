(defun maxx(x lvl)
    (cond
        ((and (numberp x) (= (mod lvl 2) 1)) x)
        ((numberp x) -9999)
        ((atom x) -9999)
        (T (apply 'max (mapcar (lambda (a) (maxx a (+ lvl 1))) x)))
    )
)

(defun check(x)
    (cond
        ((= (mod (maxx x 0) 2) 0) 1)
        (T 0)
    )
)

(defun solve(l)
    (cond
        ((atom l) 0)
        (T (+ (check l) (apply '+ (mapcar 'solve l))))
    )
)

(write (solve '(A (B 1) (1 C 4) 7 (D 1 (6 F)) ((G 4) 6))))
