devide(X, Y) :- 0 is X mod Y, !.
devide(X, Y) :- X > Y + 1, devide(X, Y+1).

prime(2) :- true, !.
prime(X) :- X < 2, !, false.
prime(X) :- not(devide(X, 2)).

remove([], _, _, []).
remove([H|T], N, I, R) :-
    I < N,
    prime(H),
    I1 is I + 1,
    remove(T, N, I1, Rt),
    R = Rt.

remove([H|T], N, I, R) :-
    remove(T, N, I, Rt),
    R = [H | Rt].