;Intr-o lista neliniara raman doar atomii in ordine inversa
;(((A B) 2 C) 3 (D 1 E)) -> (E D C B A)


(defun my_append (l e)
    (if (null l)
        e
        (cons (car l) (my_append(cdr l) e))
    )
)

(defun all_atoms(l)
    (cond
        ((null l) nil)
        ((numberp l) (all_atoms (cdr l)))  
        ((listp (car l)) (my_append (all_atoms (cdr l)) (all_atoms(car l))))
        (T (my_append (cdr l) (list (car l))))
    )   
)

(defun all_atomsR(l)
    (reverse l)
)

(print  (all_atoms '(((A B) 2 C) 3 (D 1 E)))) ;-> (E D C B A) 
(print (my_append '(1 2 3) 4))