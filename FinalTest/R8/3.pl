subset([], []).
subset([H|T], [H|R]) :-
    subset(T, R).
subset([_|T], R) :-
    subset(T, R).

lengthList([], 0).
lengthList([_|T], C) :-
    lengthList(T, C1),
    C is C1 + 1.


check([]).
check([_,_|T]):-
    check(T).

oneSol(L, R) :-
    subset(L, R),
    check(R).

allSol(L, R) :-
    findall(PR, oneSol(L, PR), R).