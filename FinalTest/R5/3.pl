sumList([], 0).
sumList([H|T], S) :-
    sumList(T, S1),
     S is S1 + H.

subSet([], []).
subSet([H|T], [H|R]) :-
    subSet(T, R).
subSet([_|T], R) :-
    subSet(T, R).

oneSol(L, S, R) :-
    subSet(L, R),
    sumList(R, S).

allSol(L, S, R) :-
    findall(RP, oneSol(L, S, RP), R).