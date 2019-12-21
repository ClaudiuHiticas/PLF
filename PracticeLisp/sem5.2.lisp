; Probleme1: Media aritmetica a 3 numere date ca parametru
(defun media(a b c)
    (/ (+ a (+ b c)) 3)
)

(print(media 5 6 8))

; Problema2: Factorialul unui numar

(defun fact(n)
    (cond 
        ((equal n 0) 1)
        (T (* n (fact (- n 1))))
    )
)
(print(fact 5))

;Problema3: Interclasarea a 2 seturi sortate
(defun intercls(a b)
    (cond 
        ((and (null a) (null b)) nil)
        ((null a) b)
        ((null b) a)
        ((< (car a) (car b)) (cons (car a) (intercls (cdr a) b)))
        ((> (car a) (car b)) (cons (car b) (intercls a (cdr b))))
    )
)

(print( intercls '(1 3 5 7) '(2 4 6 8)))

;Problem4: Adaugarea unui element din P in P pozitii
(defun addEl (a el p cnt)
    (cond
        ((null a) nil)
        ((equal p cnt) (cons el (addEl a el p 0)))
        (T (cons (car a) (addEl (cdr a) el p (+ cnt 1))))
    )
)

(print(addEl '(12 14 3 2 5 3 2) 7 2 0))

;Problem5: Definiti o functie care interclaseaza fara pastrarea dublurilor doua liste liniare sortate.

; interclasare(l1...ln, k1...km) =
;    [], n = 0, m = 0
;    l1, n = 1, m = 0
;    k1, n = 0, m = 1
;    interclasare(l2...ln, k1...kn), k1 = l1
;    interclasare(l2...ln, k1...kn), l1 = l2
;    interclasare(l1...ln, k2...km), k1 = k2
;    l1 + interclasare(l2...ln, k1...kn), l1 < k1
;    k1 + interclasare(l1...ln, k2...km), l1 > k1


(defun inter(a b)
    (cond 
        ((and (null a) (null b)) nil)
        ((and (null a) (null (cdr b)) b))
        ((and (null b) (null (cdr a)) a))
        ((equal (car a) (car b)) intercls a (cdr b))
        ((equal (car a) (cadr a)) intercls (cdr a) b)
        ((equal (car b) (cadr b)) intercls a (cdr b))
        ((< (car a) (car b)) (cons (car a) (intercls (cdr a) b)))
        ((> (car a) (car b)) (cons (car b) (intercls a (cdr b))))
    )
)


(print( inter '(0 3 5 7 12) '(2 4 5 8 32)))


;Problem6: Definiti o functie care elimina toate aparitiile unui element dintr-o lista neliniara.

; rem(l1...ln, e) =
;    [], n = 0
;    rem(l1, e) U rem(l2...ln, e), listp(l1) = T
;    rem(l2...ln, e), l1 = e
;    l1 + rem(l2...ln, e), otherwise

(defun re(l e)
    (cond
        ((null l) nil)
        ((listp (car l)) (cons (re (car l) e) (re (cdr l) e)))
        ((equal (car l) e) (re (cdr l) e))
        (T (cons (car l) (re (cdr l) e)))
    )
)

(print (re '(1 2 3 3 (3 (3 6) 4) (5 4 3) (3 2)) 3))


;De cate ori apare el in lista neliniara

(defun my_append(l e)
    (if (null l)
        e
        (cons (car l) (my_append (cdr l) e))
    )
)

(defun transform(l)
    (cond 
        ((null l) nil)
        ((listp (car l)) (my_append ( transform (car l))  (transform (cdr l))))
        (T (cons (car l) (transform (cdr l))))
    )
)

(print (my_append '(1 2 3) 4))
(print (transform '(1 2 3 3 (3 (3) 4) (5 4 3) (3) 3)))

(defun numar(l el)
    (cond   
        ((null l) 0)
        ((equal el (car l)) (+ (numar (cdr l) el) 1))
        (T (numar (cdr l) el))
    )

)

;; (print (lin '(1 2 3 3 (3 (3) 4) (5 4 3) (3) 3)))
(print (numar (transform '(1 2 3 3 (3 (3) 4) (5 4 3) (3) 3)) 3))
