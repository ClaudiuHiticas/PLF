;; 3.
;; a) Write a function that inserts in a linear list a given atom A after the 2nd, 4th, 6th, ... element.

;; addEl(l1..ln, el, poz, cnt) = 
;;     [],     n = 0
;;     el U addEl(l1..ln, el, poz, cnt + 1),    poz = cnt
;;     addEl(l1..ln, el, poz, cnt+1),  otherwise

(defun addEl(l el poz)
    (cond
        ((null l) nil)
        ((equal (mod poz 2) 0) (cons (car l) (cons el (addEl (cdr l) el (+ poz 1)))))
        (T (cons (car l) (addEl (cdr l) el (+ poz 1))))
    )   
)



;; (print(addEl '(1 2 3 4 6 7) 5 1))


;; b) Write a function to get from a given list the list of all atoms, on any
;;  level, but reverse order. Example:
;;  (((A B) C) (D E)) ==> (E D C B A)



(defun my_append(l k)
    
    (if (null l)
        k
        (cons (car l) (my_append (cdr l) k))
    )
    
)

(defun all_atoms(l)
    (cond
        ((null l) nil)
        ((listp (car l)) (my_append (all_atoms (cdr l)) (all_atoms (car l))))
        (T (my_append (all_atoms (cdr l)) (list (car l))))
    )
)

(print (all_atoms '(((A B) C) (D E))))
(print (my_append '(1 2 3 4 5) 6))

;; c) Write a function that returns the greatest common divisor of all numbers in a nonlinear list.

(defun _gcd (a b)
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((equal b 0) a)
        (T (_gcd b (mod a b)))
    )
)

(defun list_gcd (l)
    (cond
        ((and (atom (car l)) (null (cdr l))) (car l))
        ((listp (car l)) (_gcd (list_gcd (cdr l)) (list_gcd (car l))))
        (T (_gcd (car l) (list_gcd (cdr l))))
    )
)



(print(_gcd 6 8))
(print (list_gcd '(24 ( 16 (12 A B)) 72)))  ;=>4


;; d) Write a function that determines the number of occurrences of a given atom in a nonlinear list.

(defun nr_of_occ(l nr cnt)
    (cond
        ((null l) cnt)
        ((equal (car l) nr) (nr_of_occ (cdr l) nr (+ cnt 1)))
        (T (nr_of_occ (cdr l) nr cnt)) 
    )
)

(print (nr_of_occ '(1 2 1 2 3 2 1) 1 0))