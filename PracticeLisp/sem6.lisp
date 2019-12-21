; Seminar 6 - Functii MAP

; 1. Determinarea patratului unui nr.

(defun patrat(n) (* n n))

(print(patrat 2))

; + det patratul fiecarui element dintr-o lista : (2 3 4) => (4 9 16)

(defun patrat_list(l)
    (cond
        ((null l) nil)
        (T (cons (patrat (car l)) (patrat_list (cdr l))))
    )
)
(print (patrat_list '(2 3 4)))

; - mapcar functie parametrii => det / return o lista dupa aplicarea functiei

(defun listaPatrat(l)
    (mapcar 'patrat l)
)
(print (listaPatrat '(2 3 4)))

(defun listaPatrat2(l)
    (mapcar #'(lambda(x) (* x x)) l)
)
(print (listaPatrat2 '(2 3 4)))

; 2. Sa se insumeze o constanta k la valorile unei liste liniare
; 2 , (6 8 20) => (8 10 12)

(defun sum(c l)
    (mapcar #'(lambda(x) (+ x c)) l)
)

(print(sum 2 '(6 8 10)))

; 3. Pentru o lista neliniara sa se produca modificari:
; (1 a 2 (3 b 4 (5 1))) => (2 a 4 (6 b 8 (10 2)))a

(defun sumList(l)
    (cond
        ((listp l) (mapcar 'sumList l))
        ((numberp l) (* l 2))
        ((atom l) l)
    )
)

(print (sumList '(1 a 2 (3 b 4 (5 1)))))

; 4. Produsul elem numerice dintr-o lista neliniara
; (2 a (3 b (4 5 c))) => 2 * 3 * 4 * 5

; (apply functie params) - return un singur rez

;(apply '+ (1 2 3 4 5)) ; => 15
;(apply 'max (1 2 3 4 5)) ; => 5


(defun prod(l)
    (cond
        ((numberp l) l)
        ((atom l) 1)
        ((listp l) (apply '* (mapcar 'prod l)))
    )
)

(print (prod '(2 a (3 b (4 5 c)))))

; 5. Se da o lista neliniara. 
; Sa se determine nr sublistelor in care primul atom numeric la orice nivel are valoarea 5
; (a 5 (b c d) 2 1 (g (5 h) 7 d) 11 14)
;=>
; (5 h)
; (a 5 (b.....
; (g (5 h) 7 d)

(defun lin_del(l)
	(cond
        ((null l) nil)
		((numberp (car l)) (cons (car l) (lin_del (cdr l))))
		((atom (car l))(lin_del (cdr l)))
		((listp (car l)) ( append (lin_del (car l)) (lin_del (cdr l))))
	)
)

(defun first5(l)
	(cond
		((null (lin_del l)) nil)
		((equal 5 (car (lin_del l))) T)
		(t nil)
	)
)

(defun numar(l)
	(cond
		((atom l) 0)
		((and (listp l) (first5 l)) (+ 1 (apply ' + (mapcar ' numar l))))
		(T (apply '+ (mapcar ' numar l)))
	)
)


(print (lin_del '(a 5 (b c d) 2 1 (g (5 h) 7 d) 11 14)))

;6. Sa se determine numarul nodurilor de pe nivelele pare dintr-un arbore reprezentat ca si o lista

; 1 a
;   | \
; 2 b  c 
;   |
; 3 d
;   |
; 4 e

; (a (b (d (e))) (c))


; nr(l) = 
; - 1 , l - atom, nivel par
; - 0 , l - atom, nivel impar
; - noduriPare(li,nivel + 1),  li - lista .... sth with mapcar

(defun count2(l level)
    (cond
        ((and (atom l) (= (mod level 2) 0)) 1)
        ((and (atom l) (= (mod level 2) 1)) 0)
        ((listp l) (apply '+ (mapcar #' (lambda (x) (count2 x (+ 1 level))) l)))
    )

)

(print(count2 '(a (b (d (e))) (c)) 0))