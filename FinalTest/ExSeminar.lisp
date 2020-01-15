(defun transform(l lvl) 
    (cond
        ((and (numberp l) (= (mod lvl 2) 0)) (list l))
        ((numberp l) nil)
        ((atom l) nil)
        (T (apply 'append (mapcar (lambda (el) (transform el (+ lvl 1)))l)))
    )
)

(print (transform '(a b 12 (9 d (a f (75 b) d (45 f) 1) 15) c 9) 0))


(defun cmmdc(a b)
    (cond
        ;; ((and (not (numberp a))(not (numberp b))) nil)
        ;; ((not (numberp a)) b)
        ;; ((not (numberp b)) a)
        ((= b 0) a)
        (T (cmmdc b (mod a b)))
    )
)
(print (cmmdc 5 15))

(defun cmmdcList(l)
    (setq l (transform l 0))
    (cond
        ((null (cdr l)) (car l))
        (T (cmmdc (car l) (cmmdcList (cdr l))))
    )
)

(print (cmmdcList '(a b 12 (9 d (a f (75 b) d (45 f) 1) 15) c 9)))
