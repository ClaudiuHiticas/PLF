(defun duplicate(l p k)
    (cond
        ((null l) nil)
        ((= p k) (append (list (car l) (car l)) (duplicate (cdr l) 1 k)))
        (t (cons (car l) (duplicate (cdr l) (+ p 1) k)))
    )
)

(print (duplicate '(1 2 3 4 5) '1 '2))