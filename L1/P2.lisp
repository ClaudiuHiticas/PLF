;; 2.
;; a) Write a function to return the product of two vectors.
;; https://en.wikipedia.org/wiki/Dot_product


(defun dot_product(l k)
    (cond
        ((and (null l) (null k)) 0)
        (T (+ (* (car l) (car k)) (dot_product (cdr l) (cdr k))))
    )
)

(print (dot_product '(1 2 3 4) '(4 5 6 7)))
; => 1*4 + 2*5 + 3*6 = 32



;b) Write a function to return the depth of a list. Example: the depth of a linear list is 1.

(defun my_max(a b)
    (if (> a b) a b) 
)

(defun depth_list(l cnt)
    (cond   
        ((null l) cnt)
        ((listp (car l)) (my_max (depth_list (car l) (+ cnt 1)) (depth_list (cdr l) cnt)))
        (T (depth_list (cdr l) cnt))
    )   
)


(print (depth_list '(1 (2 (3 4 (5 (12 15)) (6)) 5) 6) 0))


;c) Write a function to sort a linear list without keeping the double values.

