(defun appOr(l)
    (cond
        ((null l) nil)
        (T (OR (car l) (appOr (cdr l))))
    )
)

(write (appOr '(2 3 4 5)))

(write (eval (cons 'or '(1 2 3 4))))