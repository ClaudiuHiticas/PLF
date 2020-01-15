(defun oddLvl(x lvl)
    (cond
        ((and (not (listp x)) (= (mod lvl 2) 0)) 0)
        ((and (not (listp x)) (not (numberp x))) 1)
        ((numberp x) 0)
        (T (apply '+ (mapcar #'(lambda (a) (oddLvl a (+ 1 lvl)))x)))
    )
)

(defun check(x)
    (cond
        (T (mod (oddLvl x 0) 2))
    )
)

(defun solve(l)
    (cond
        ((atom l) 0)
        (t (+ (check l) (apply '+(mapcar 'solve l))))
    )

)

(write (solve '(A (B 1) (1 C 4) 7 (D 1 (6 F)) ((G 4) 6))))
