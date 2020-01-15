pow(_, 0, 1).
pow(X, N, R) :-
    N > 0,
    N1 is N - 1,
   	pow(X, N1, Rt),
    R is Rt * X, !.