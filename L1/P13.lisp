;13.
;a) A linear list is given. Eliminate from the list all elements from N to N steps, N-given.

;remove(l1..ln, k) =
;   [],     n = 0
;   remove(l2..ln, n), k = 1
;   l1 U remove(l2..ln, k-1), otherwise

(defun removee(l n k)
    (cond
        ((null l) nil)
        ((= k 1) (removee (cdr l) n n))
        (T (cons (car l) (removee (cdr l) n (- k 1))))
    )
)

(defun removeFinal(l n)
    (removee l n n)
)

(print(removeFinal '(1 2 3 4 5 6 7) 2))


;b)Write a function to test if a linear list of integer numbers has a "valley" aspect (a list has a valley
;aspect if the items decrease to a certain point and then increase. Eg. 10 8 6 17 19 20). A list must
;have at least 3 elements to fullfill this condition.

;valley(l1..ln, last) =
;   true,               n = 1, last < l1
;   valley(l2..ln, l1), l1 > l2 and last > l1
;   valley(l2..ln, l1), last > l1 and l1 < l2
;   valley(l2..ln, l1), l1 < l2 and last > l1
;   false             , otherwise

;; (defun valley(l last)
;;     (cond
;;         ((and (= (list-length l) 1) (< last (car l))) T)
;;         ((and (> (car l) (cadr l)) (> last (car l))) (valley (cdr l) (car l)))
;;         ((and (> last (car l)) (< (car l) (cadr l))) (valley (cdr l) (car l)))
;;         ((and (< (car l) (cadr l)) (> last (car l))) (valley (cdr l) (car l)))
;;     )
;; )

;; (print (valley '(10 8 6  3 7 12 15) 12))

;_valley(l1..ln, dec) =
;   true,   n = 1 and !dec
;   false,  l1 > l2 and !dec
;   _valley(l2..ln, dec),     l1 < l2 and dec = true
;   _valley(l2..ln, dec),     otherwise

(defun _valley (l decreasing)
	(cond
		((= (list-length l) 1) (if decreasing nil T))
		((and (> (car l) (cadr l)) (not decreasing)) nil)
		((and (< (car l) (cadr l)) decreasing) (_valley (cdr l) nil))
		(T (_valley (cdr l) decreasing))
	)
)

(defun valley (l)
	(if (< (list-length l) 3)
		nil
		(_valley l T)
	)
)

(print (valley '(10 8 6  3 7 12 15)))

;c)Build a function that returns the minimum numeric atom from a list.

;min(a, b) =
;   a,  a < b
;   b, otherwise

;minList(l1..ln) = 
;   l1,     n = 1
;   min(l1, minList(l2..ln)),   otherwise

(defun minList(l)
    (cond
        ((= (length l) 1) (car l))
        (T (min (car l) (minList (cdr l))))
    )
)

(print (minList '(2 3 4 5)))

;d) Write a function that deletes from a linear list of all occurrences of the maximum element.

;max(a, b) =
;   a,  a > b
;   b, otherwise

;maxList(l1..ln) = 
;   l1,     n = 1
;   max(l1, maxList(l2..ln)),   otherwise

(defun maxList(l)
    (cond
        ((= (length l) 1) (car l))
        (T (max (car l) (maxList (cdr l))))
    )
)

;remOcc(l1..ln, el) =
;   [],     n = 0
;   remOcc(l2..ln, el)   ,l1 = el
;   l1 U remOcc(l2..ln, el), otherwise

(defun remOcc (l el)
    (cond
        ((null l) nil)
        ((= (car l) el) (remOcc(cdr l) el))
        (T (cons (car l) (remOcc (cdr l) el)))
    )
)

;; (print (remOcc '(1 2 1 4 2 1) 1))
;remMax(l1..ln) = remOcc(maxList)
(defun remMax (l)
    (remOcc l (maxList l))
)

(print (remMax '(1 2 1 2 3 3 2 3)))