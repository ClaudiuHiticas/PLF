(defun f(l)
    (max (car l) (caddr l))
)

(setf g 'f)
(setq f 10)
(write (funcall G '(8 11 12 3 7 9)))