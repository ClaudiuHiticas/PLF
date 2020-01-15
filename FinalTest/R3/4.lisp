(defun inloc(l k p)
    (cond
        ((and (atom l) (= k p)) 0)
        ((atom l) l)
        (T (mapcar #'(lambda (a) (inloc a (+ k 1) p)) l))
    )
)

(print(inloc '(a (1 (2 b)) (c (d))) 0 2))
(print(inloc '(a (1 (2 b)) (c (d))) 0 1))
(print(inloc '(a (1 (2 b)) (c (d))) 0 3))