(defun solve(x l k e)
    (cond
        ((and (atom x) (= k l)) e)
        ((atom x) x)
        (T (mapcar (lambda (a) (solve a (+ l 1) k e)) x))
    )
)


(write (solve '(a (b (g)) (c (d (e)) (f))) -1 3 'h))
