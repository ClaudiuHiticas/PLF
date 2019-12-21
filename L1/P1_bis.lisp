;L1
;1.
;a) Write a function to return the n-th element of a list, or NIL if such an element does not exist.
(defun flatten (list)
  (if (listp list)
      (mapcan 'flatten list)
      (list list)))

(defun elemN(l n cnt)
    (cond
        ((null  l) nil)
        ((= cnt n) (car l))
        (T (elemN (cdr l) n (+ cnt 1)))
    )
)

(print (elemN (flatten '(0 (2 4) 6 8)) 3 0))


; b) Write a function to check whether an atom E is a member of a list which is not necessarily linear.

(defun check_atom(l e)
    (cond
        ((null l) nil)
        ((and(atom (car l)) (equal (car l) e)) T)
        ((atom (car l)) (check_atom (cdr l) e))
        ((or (check_atom (cdr l) e) (check_atom (car l) e)) (list (car l)))
    )
)

(print (check_atom (flatten '(((A B) 2 C) 3 (D 1 E))) '2))

;;  c) Write a function to determine the list of all sublists of a given list, on any level.
;;  A sublist is either the list itself, or any element that is a list, at any level. Example:
;;  (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 sublists :
;;  ( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) )

(defun sublists (l)
    (cond
        ((atom l) nil)
        (T (apply 'append (list l) (mapcar 'sublists l)))
    )
)

(print (sublists '(1 2 (3 (4 5) (6 7)) 8 (9 10))))

; d) Write a function to transform a linear list into a set.

(defun transform_set (l)
    (cond
        ((null l) nil)
        (T (cons (car l) (transform_set (remove_apparences (cdr l) (car l)))))
    )
)

(defun remove_apparences (l e)
    (cond
        ((null l) nil)
        ((= (car l) e) (remove_apparences (cdr l) e))
        (T (cons (car l) (remove_apparences (cdr l) e)))
    )
)

(print (transform_set '(1 2 3 44 2 4  5 2 3 3 3 3 4 4 5 77)))


;L2
; a) Write a function to return the product of two vectors.
; https://en.wikipedia.org/wiki/Dot_product

(defun dot_product (a b)
    (if (null a)
        0
        (+ (* (car a) (car b)) (dot_product (cdr a) (cdr b)))
    )
)

(print (dot_product '(1 2 3) '(4 5 6)))
; => 1*4 + 2*5 + 3*6 = 32

;b) Write a function to return the depth of a list. Example: the depth of a linear list is 1.

(defun my_max (a b)
    (if (> a b) a b)
)



(defun depth(l cnt)
    (cond
        ((null l) cnt)
        ((listp (car l)) (my_max (depth (car l) (+ cnt 1)) (depth (cdr l) cnt)))
        (T (depth (cdr l) cnt))
    )
)

(print (depth '(1 (2 (3 6) 4) 5) 1)) ;=>3

;c) Write a function to sort a linear list without keeping the double values.
(defun insert (l el)
    (cond 
        ((null l) (list el)) 
        ((equal (car l) el) l)
        ((< el (car l)) (cons el l))
        (T (cons (car l) (insert (cdr l) el))) 
    )
)

(defun sortul (l)
    (cond
        ((null l) nil)
        (T (insert (sortul (cdr l)) (car l)))
    )
)


(print (sortul '(7 2 3 2 5 4 2 1)))


; d) Write a function to return the intersection of two sets.

(defun remove_first_ap (l e)
    (cond 
        ((null l) nil)
        ((equal (car l) e) (cdr l))
        (T (cons (car l) (remove_first_ap (cdr l) e)))
    )
)

(defun contains (l e)
    (cond
        ((null l) nil)
        ((equal (car l) e) T)
        (T (contains (cdr l) e))
     )
)

(defun intersection_sets (l k)
    (cond
        ((or (null l) (null k)) nil)
        ((contains k (car l)) (cons (car l) (intersection_sets (cdr l) (remove_first_ap (cdr k) (car l)))))
        (T (intersection_sets (cdr l) k))
    )
)

(print (intersection_sets '(1 2 3 4 5) '(1 5 6 7 9)))
; => (1 5)

;L3
;a) Write a function that inserts in a linear list a given atom A after the 2nd, 4th, 6th, ... element.
(defun insertElem(l el poz)
    (cond
        ((null l) nil)
        ((= (mod poz 2) 0) (cons (car l) (cons el (insertElem (cdr l) el (+ poz 1)))))
        (T (cons (car l) (insertElem (cdr l) el (+ poz 1))))
    )
)

(print(insertElem '(1 2 3 4 5 6) 7 1))

;; b) Write a function to get from a given list the list of all atoms, on any
;;  level, but reverse order. Example:
;;  (((A B) C) (D E)) ==> (E D C B A)

(defun flatten (list)
    (if (listp list)
        (mapcan 'flatten list)
        (list list)
    )
)

(defun invers(list)
    (reverse list)
)

(print (invers (flatten '(((A B) C) (D E)) )))


;c) Write a function that returns the greatest common divisor of all numbers in a nonlinear list.

(defun cmmdc(a b)
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((equal b 0) a)
        (T (cmmdc b (mod a b)))
    )
)

(defun cmmdcList(l rez) ;Linear
    (cond
        ((null l) rez)
        
        (T (cmmdcList (cdr l) (cmmdc rez (car l))))

    )
)

(defun cmmdcList2(l)    ;NonLinear
    (cond
        ((and (atom (car l)) (null (cdr l))) (car l))
        ((listp (car l)) (cmmdc (cmmdcList2 (cdr l)) (cmmdcList2 (car l))))
        (T (cmmdc (car l) (cmmdcList2 (cdr l))))
    )
)

(print (cmmdc 9 12))
(print (cmmdcList '(3 12 9 15) 3))
(print (cmmdcList2 '(24 ( 16 (12 A B)) 72)))

;; d) Write a function that determines the number of occurrences of a given atom in a nonlinear list.

(defun occurences(l el)
    (cond
        ((and (atom l) (equal l el)) 1)
        ((atom l) 0)
        (T (apply '+ (mapcar #' (lambda (a) (occurences a el)) l)))
    )
)

(print (occurences '(1 (3 (5 4 3) (5 3)) 3 3) 3))