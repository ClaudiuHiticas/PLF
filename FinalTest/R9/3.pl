subSet([], []).
subSet([H|T], [H|R]) :-
    subSet(T, R).
subSet([_|T], R) :-
    subSet(T, R).

count([], 0).
count([_|T], C) :-
    count(T, C1),
    C is C1 + 1.
   

oneSol(L, K, R) :-
    subSet(L, R),
    count(R, C),
    C =:= K.

allSol(L, K, R) :-
    findall(PR, oneSol(L, K, PR), R).