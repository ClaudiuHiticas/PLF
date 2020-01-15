(defun repl(x l k e)
    (cond
        ((and (atom x) (= l k)) e)
        ((atom x) x)
        (T (mapcar (lambda (a) (repl a (+ l 1) k e)) x))
    )
)


(write (repl '(a (b (g)) (c (d (e)) (f))) 0 1 'z))
