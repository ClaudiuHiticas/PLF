;a) Write a function to return the n-th element of a list, or NIL if such an element does not exist.

;elemN(l1..ln, x, cnt) = 
;   nil,   n = 0
;   lcnt,   cnt = x
;   elemN(l2..ln, x, cnt+1), otherwise

(defun elemN(l n cnt)
    (cond
        ((null  l) nil)
        ((= cnt n) (car l))
        (T (elemN (cdr l) n (+ cnt 1)))
    )
)


;(print(elemN '(1 2 3 4 5 6) 8 0)) 

;b) Write a function to check whether an atom E is a member of a list which is not necessarily linear.
;isMember(l1..ln, elem) = 
;   true,   l1 = elem
;   false,  n = 0
;   isMember(l2..ln, elem),     otherwise

(defun isMember(l elem)
    (cond
        ((null l) nil)
        ((= (car l) elem) T)
        (T (isMember (cdr l) elem))
    )
)

(print(isMember '(1 2 3 4 5) 6))

;; c) Write a function to determine the list of all sublists of a given list, on any level.
;;  A sublist is either the list itself, or any element that is a list, at any level. Example:
;;  (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 sublists :
;;  ( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) )

(defun all_sublists (l)
    (cond
        ((atom l) nil)
        (T (apply 'append (list l) (mapcar 'all_sublists l)))
    )
)

(print (all_sublists '(1 2 (3 (4 5) (6 7)) 8 (9 10))))

;; d) Write a function to transform a linear list into a set.

;; removeApparence(l1..ln, el) = 
;;     [], n = 0
;;     removeApparence(l2..ln, el),    l1 = el
;;     l1 U removeApparence(l2..ln, el),    l1 != el

(defun removeApparence(l el)
    (cond
        ((null l) nil)
        ((equal (car l) el) (removeApparence (cdr l) el))
        (T (cons (car l) (removeApparence (cdr l) el)))
    )
)

(defun doSet(l)
    (cond
        ((null l) nil)
        (T (cons (car l) (doSet (removeApparence(cdr l) (car l)))))
    )
)

(print (doSet '(1 2 3 2 1 2 3 4 2 3 4 4)))