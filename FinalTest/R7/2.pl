%1st method
count([], _, 0).
count([H|T], El, C) :-
 	El =:= H,
    count(T, El, C1),
    C is C1 + 1.

count([H|T], El, C) :- 
    El =\= H,
    count(T, El, C1),!,
    C = C1.

solve([], []).
solve([H|T], R) :-
    count(T, H, X),
    X =:= 0,
    solve(T, R1),
    R = [H|R1].

solve([H|T], R) :-
    count(T, H, X),
    X =\= 0,
    solve(T, R).

%2nd method
member(H, [H | _]).
member(E, [_ | T]) :-
    member(E, T).

addIfOkay(H, Tr, X) :-
    member(H, Tr),
    X = Tr.

addIfOkay(H, Tr, X) :-
    not(member(H, Tr)),
    X = [H | Tr].

toset([], []).
toset([H | T], X) :-
    toset(T, Tr),
    addIfOkay(H, Tr, X).

toset([], X, X).
toset([H | T], Y, X) :-
    not(member(H, Y)),
    toset(T, [H | Y], X).

toset([H | T], Y, X) :-
    member(H, Y),
    toset(T, Y, X).