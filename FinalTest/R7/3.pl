subSet([], []).
subSet([H|T], [H|R]) :-
    subSet(T, R).
subSet([_|T], R) :-
    subSet(T, R).

prodList([], 1).
prodList([H|T], P) :-
    prodList(T, P1),
    P is P1 * H.

oneSol(L, P, R) :-
    subSet(L, R),
    prodList(R, P).

allSol(L, P, R) :-
    findall(PR, oneSol(L, P, PR), R).