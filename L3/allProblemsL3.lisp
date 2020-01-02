;; 1. Write a function to check if an atom is member of a list (the list is non-liniar)
(defun countMember(l el)
    (cond
        ((and (atom l) (= l el)) 1)
        ((atom l) 0)
        ((listp l) (apply '+(mapcar (lambda (x)(countMember x el)) l)))
    )
)

(defun checkMember(l el)
    (cond
        ((null l) nil)
        ((> (countMember l el) 0) 1)
    )
)

(print (checkMember '(1 2 3 1 2 3 3 2 1 4 3 2) 3))

;2. Write a function that returns the sum of numeric atoms in a list, at any level.
; (sumlist '(1 2 3 A B 4 (32 (5) (3) (1 (1)) C))) => 52

(defun sumList(l)
    (cond
        ((numberp l) l)
        ((atom l) 0)
        ((listp l) (apply '+ (mapcar 'sumList l)))
    )
)

(print (sumlist '(1 2 3 A B 4 (32 (5) (3) (1 (1)) C))))

;; 3 is the same like 1

;4. Write a function that returns the product of numeric atoms in a list, at any level.
(defun prodList(l)
    (cond
        ((numberp l) l)
        ((atom l) 1)
        ((listp l) (apply '* (mapcar 'prodList l)))
    )
)

(print (prodList '(1 2 (D 3 (4 F G)))))

;; 5. Write a function that computes the sum of even numbers and the decrease the sum of odd numbers,
;; at any level of a list.
(defun sumdec(l)
    (cond 
        ((and (numberp l) (= (mod l 2) 0)) l)
        ((and (numberp l) (= (mod l 2) 1)) (* l '-1))
        ((atom l) 0)
        ((listp l) (apply '+ (mapcar 'sumdec l)))
    )
)
(print (sumdec '(1 2 3 4 5 6)))

;; 6. Write a function that returns the maximum of numeric atoms in a list, at any level.
(defun maxList(l)
    (cond
        ((numberp l) l)
        ((atom l) 0)
        (T (apply #' max(mapcar #' maxList l))) 
    )
)
(print (maxList '(1 2 3 2 3 2 1)))

;7. Write a function that substitutes an element E with all elements of a list L1 at all levels
;of a given list L

(defun sub(l e l1)
    (cond
        ((null l) nil)
        ((atom l) (if (= l e) l1 l))
        (T (mapcar #'(lambda (a) (sub a e l1)) l))
    )
)

(print (sub '(1 2 (3 2) 1 2) 2 '(7 8 9)))

;; 9. Write a function that removes all occurrences of an atom from any level of a list.
(defun remov(l el)
    (cond
        ((and (atom l) (/= l el)) l)
        ((listp l) (mapcar (lambda (a) (remov a el)) l))
    )
)
(print (remov '(1 2 3 4 2 3) 3))


;; 10. Define a function that replaces one node with another one in a n-tree represented as: root
;; list_of_nodes_subtree1... list_of_nodes_subtreen)
;; Eg: tree is (a (b (c)) (d) (e (f))) and node 'b' will be replace with node 'g' => tree (a (g (c)) (d) (e (f)))}

;Not Working
(defun replTree(l e r)
    (cond
        ((null l) nil)
        ((atom l) (if (equal l e) r l))
        (T (mapcar #'(lambda (a) (replTree a e r)) l))
    )
)

(print (replTree '(a (b (c)) (d) (e (f))) 'b 'g))


;; 11. Write a function to determine the depth of a list.
(defun depth(l lvl)
    (cond
        ((atom l) lvl)
        ((listp l) (apply 'max (mapcar (lambda (a) (depth a (+ lvl 1)))l)))
    )
)

(print (depth '(1 2 (3 4 (5 6 ) (2 4))) 0))

;; 12. Write a function that substitutes an element through another one at all levels of a given list
(defun repl(l e r)
    (cond
        ((and (numberp l) (if (= l e) r l)))
        ((listp l) (mapcar #'(lambda (a) (repl a e r)) l))
    )
)

(print (repl '(1 2 (2 1 3 (3 2 1 (3 2 (1 2 3))))) 1 7))

;; 13 is the same like 11

;; 14. Write a function that returns the number of atoms in a list, at any level.
(defun nrAtoms(l)
    (cond
        ((atom l) 1)
        ((listp l) (apply '+ (mapcar 'nrAtoms l)))
    )
)

(print (nrAtoms '(1 2 (3 4 (5 6)))))

;; 15. Write a function that reverses a list together with all its sublists elements, at any level.

(defun reverseList(l)
    (cond
        ((atom l) l)
        ((listp l) (mapcar 'reverseList (reverse l)))
    )
)

(print(reverseList '(1 2 3 (4 5 (6 A 7)))))

;; 16. Write a function that produces the linear list of all atoms of a given list, from all levels, and written in
;; the same order. Eg.: (((A B) C) (D E)) --> (A B C D E)

(defun linearList(l)
    (cond
        ((atom l) (list l))
        ((listp l) (mapcan 'linearList l))
    )
)

(print (linearList '(((A B) C) (D E))))

