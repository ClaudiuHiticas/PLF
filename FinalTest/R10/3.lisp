(defun g(l)
    (+ (car l) (cadr l))
)

(print (g '(1 2 3 4 5)))

(setq h 'f)
(set h 'g)
(print (funcall f '(1 2 3 4 5)))