minsert([], E, [E]).
minsert([H|T], E, [E,H|T]).
minsert([H|T], E, [H|R]) :-
    minsert(T, E, R).

perm([], []).
perm([H|T], R) :-
    perm(T, Rt),
    minsert(Rt, H, R).
   
valAbs(A, B, R) :-
    A > B,
    R is A - B, !.
valAbs(A, B, R) :-
    A < B,
    R is B - A, !.

check([_]).
check([H1,H2|T]) :-
    valAbs(H1, H2, R),
    R =< 3,
    check([H2|T]), !.

oneSol(L, R) :-
    perm(L, R),
    check(R).

allSol(L, R) :-
    findall(RP, oneSol(L, RP), R).