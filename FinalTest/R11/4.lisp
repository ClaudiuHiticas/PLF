(defun path(x e c)
    (cond
        ((and (atom x) (eq x e)) c)
        ((atom x) nil)
        (t (apply 'append (mapcar (lambda (el) (path el e (append c (list (car x)))))x)))
    )
)

(write (path '(a (b (g)) (c (d (e)) (f))) 'e nil))