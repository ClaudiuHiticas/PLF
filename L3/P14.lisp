;Write a function that returns the number of atoms in a list, at any level.

(defun atomsCnt (el)
    (cond
        ((atom el) 1)
        ((listp el) (apply '+ (mapcar 'atomsCnt el)))
    )
)

(print (atomsCnt '(1 2 (3 A (B 4 (C))))))