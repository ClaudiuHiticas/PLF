fact1(0, 1).
fact1(N, F) :-
    N > 0,
    N1 is N-1,
    fact1(N1, F1),
    F is F1 * N.
go1 :- fact1(3, 6).

fact2(0, 1) :- !.
fact2(N,F) :-
    N1 is N - 1,
    fact2(N1, F1),
    F is F1 * N.
go2 :- fact2(4, 24).