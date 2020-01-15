(defun mmax(x)
    (cond
        ((numberp x) x)
        ((atom x) -9999)
        (T (apply 'max(mapcar 'mmax x)))
    )
)

(defun check(l)
    (- 1 (mod (mmax l) 2))  ; maximul -> 0 - impar; 1 - par
)

(defun solve(l)
    (cond
        ((atom l) 0)
        (T (+ (check l) (apply '+ (mapcar 'solve l))))
    )
)


(print (solve '(a (b 1) (1 c 4) 7 (d 1 (6 f)) ((g 4) 6))))
;; (print (check '(1 2 3 5)))  