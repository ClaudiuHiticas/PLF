%obviously not correct, but at least i tried.
invers([], []).
invers([H|T], R) :-
    invers(T, R1),
    R = [R1|H].