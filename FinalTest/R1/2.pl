lungimeN([], 0).
lungimeN([_|T], C):-
    lungimeN(T, C2),
    C is C2 + 1.

elimin([], _, _, []).
elimin([H|T], I, N, R) :-
    is_list(H),
    lungimeN(H, Lun),
    mod(Lun, 2) =:= 0,
    I < N,
    I1 is I + 1,
    elimin(T, I1, N, R1),
    R = R1.
elimin([H|T], I, N, R) :-
    elimin(T, I, N, R1),
    R = [H|R1].

