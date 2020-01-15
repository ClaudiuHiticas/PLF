(defun repl(x)
    (cond
        ((and (numberp x) (= (mod x 2) 0)) (+ x 1))
        ((atom x) x)
        (T (mapcar (lambda (a) (repl a))x))
    )
)

(print (repl '(1 s 4 (2 f (7)))))