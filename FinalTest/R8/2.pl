removeList([], _, _, []).
removeList([_|T], K, P, R) :-
    P =:= K,
    P1 is P + 1,
    K1 is K * 2,
    removeList(T, K1, P1, R).
   

removeList([H|T], K, P, R) :-
    P =\= K,
    P1 is P + 1,
    removeList(T, K, P1, R1),
    R = [H|R1].

