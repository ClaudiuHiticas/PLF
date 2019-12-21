; Pb1: Media aritmetica a 3 numere date ca parametru

(defun ma (a b c)
    (/ (+ (+ a b) c) 3)
)
(setq media (ma 2 3 5))
(print media)

;Pb2: Factorialul unui numar

;fact(n) = 
;   1, n = 0 or n = 1
;   n*fact(n-1), otherwise

(defun fact (n)
    (cond
        ((or (equal n 0) (equal n 1)) 1)
        (T (* n (fact(- n 1))))
    )
)

(print (fact 5))


;Pb3: Interclasarea a 2 seturi sortate

;inter(l1..ln, q1..qm) = 
;   l, m = 0
;   q, n = 0
;   l1 U inter(l2..ln, q1..qm)    ,l1 < q1
;   q1 U inter(l1..ln, q2..qm)    ,l1 > q1
;   l1 U inter(l2..ln, q1..qm)    ,l1 = q1

(defun inter (l q)
    (cond
        ((null l) q)
        ((null q) p)
        ((< (car l) (car q)) (cons (car l) (inter (cdr l) q)))
        ((> (car l) (car q)) (cons (car q) (inter l (cdr q))))
        ((= (car l) (car q)) (cons (car l) (inter (cdr l) (cdr q))))
    )
)

(setq L '(2 3 4 5))
(setq P '(4 5 6 7))
(print (inter L P))

;Pb4: Adaugarea unui element din P in P pozitii
;add(l1..ln, e, p, n) = 
;   [], n = 0
;   e U add(l1..ln, e, p+1, n)     , n % p == 0
;   l1 U add(l2..ln, e, p+1, n)    , n % p != 0

(defun adaugare (l e p n)
    (cond
        ((null l) nil)
        ((equal 0 (mod p n)) (cons e (cons (car l) (adaugare (cdr l) e (+ p 1) n))))
        (T (cons (car l) (adaugare (cdr l) e (+ p 1) n)))
    )
)
(print (adaugare '(1 2 3 4 5) 7 4 2))

;Pb5: Definiti o functie care interclaseaza fara pastrarea dublurilor doua liste liniare sortate.
;interclasare(l1..ln, k1..km) = 
;    []   , n = 0, m = 0
;    l1   , n = 1, m = 0
;    k1   , n = 0, m = 1
;    interclasare(l2...ln, k1...km), k1 = l1
;    interclasare(l2...ln, k1...km), l1 = l2
;    interclasare(l1...ln, k2...km), k1 = k2
;    l1 + interclasare(l2...ln, k1...kn), l1 < k1
;    k1 + interclasare(l1...ln, k2...km), l1 > k1


(defun interclasare (l k)
    (cond
        ((and (null l) (null k)) nil)
        ((and (null (cdr l)) (null k)) l)
        ((and (null l) (null (cdr k))) k)
        ((equal (car l) (cadr l)) (interclasare (cdr l) k))
        ((equal (car k) (cadr k)) (interclasare l (cdr k)))
        ((equal (car l) (car k)) (interclasare l (cdr k)))
        ((< (car l) (car k)) (cons (car l) (interclasare (cdr l) k)))
        ((> (car l) (car k)) (cons (car k) (interclasare l (cdr k))))
    )
)

(print (interclasare '(1 2 3 4 5 5 5) '(3 4 9 9 9)))

;Pb 6: Definiti o functie care elimina toate aparentele unui element dintr-o lista neliniara.

; rem(l1...ln, e) =
;    [], n = 0
;    rem(l1, e) + rem(l2...ln, e), listp(l1) = T
;    rem(l2...ln, e), l1 = e
;    l1 + rem(l2...ln, e), otherwise

(defun re (l e)
    (cond
        ((null l) nil)
        ((listp (car l)) (cons (re (car l) e) (re (cdr l) e)))
        ((equal (car l) e) (re (cdr l) e))
        (T (cons (car l) (re (cdr l) e)))
     )
)

(print (re '(1 2 3 3 (3 (3) 4) (5 4 3) (3)) 3))