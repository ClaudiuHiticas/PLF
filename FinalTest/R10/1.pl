% Method 1
countEl([], _,0).
countEl([H|T], El, C) :-
    H =:= El,
    countEl(T, El, C1),
    C is C1 + 1, !.
countEl([H|T], El, C) :-
    H =\= El,
    countEl(T, El, C), !.

toSet([], []).
toSet([H|T], R) :-
    countEl([H|T], H, C),
    C =:= 1,
    toSet(T, R1),
    R = [H|R1], !.

toSet([H|T], R) :-
    countEl([H|T], H, C),
    C =\= 1,
    toSet(T, R), !.

%Method 2
member(X, [X|_]).
member(X, [_|T]) :-
    member(X, T).

toSet([], []).
toSet([H|T], R) :-
    toSet(T, R),
    member(H, R), !.
toSet([H|T], [H|R]) :-
    toSet(T, R),
    not(member(T, R)), !.


