(defun getL(l lvl nr)
    (cond
        ((null l) (if (and (evenp lvl) (oddp nr)) 1 0))
        ((numberp (car l) (getL (cdr l) lvl (+ nr 1))))
        ((listp (car l) ))
    )
)