;Test 1

(defun my_append(l e)
    (if(null l)
        e
        (cons (car l) (my_append (cdr l) e))
    )
)

(defun all_atoms(l)
    (cond
        ((null l) nil)
        ((numberp (car l)) (all_atoms (cdr l)))
        ((listp (car l)) (my_append (all_atoms (cdr l)) (all_atoms (car l))))
        (T (my_append (cdr l) (list (car l))))
    )
)


(print (my_append '(1 2 3 4) 5))
(print (all_atoms '(((A B) 2 2 4 C) 3 (D E))))
