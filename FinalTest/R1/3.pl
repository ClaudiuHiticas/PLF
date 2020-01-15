subset([], []).
subset([H|T], [H|R]) :-
    subset(T, R).
subset([_|T], R) :-
    subset(T, R).


suma([], 0).
suma([H|T], S) :-
    suma(T, S1),
    S is S1 + H.

onesol(L, S, R) :-
    subset(L, R),
    suma(R, S).

allsol(L, S, R) :-
    findall(RP, onesol(L, S, RP), R).