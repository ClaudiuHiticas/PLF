% 13.
% a. Given a linear numerical list write a predicate to remove all sequences of consecutive values.
% Eg.: remove([1, 2, 4, 6, 7, 8, 10], L) will produce L=[4, 10].

% 
% 	                   |l1...ln, n <= 1
%                      |[], n = 2 and l2 = l1 + 1
% remCons(l1...ln) =   |remCons(l2...ln), l2 = l1 + 1 and l3 = l2 + 1
% 	                   |remCons(l3...ln), l2 = l1 + 1 and l3 != l2 + 1
% 	                   |l1 + remCons(l2...ln), l2 != l1 + 1

% remCons(L:list, R:list)
% flow model: remCons(i, o)

remCons([], []).

remCons([E], [E]).

remCons([H1, H2], []) :-
    H2 =:= H1 + 1.

remCons([H1, H2], [H1, H2]) :-
    H2 =\= H1 + 1.

remCons([H1, H2, H3 | T], X) :-
    H2 =:= H1 + 1,
    H3 =:= H2 + 1,
    remCons([H2, H3|T], X).

remCons([H1, H2, H3 | T], X) :-
    H2 =:= H1 + 1,
    H3 =\= H2 + 1,
    remCons([H3|T], X).

remCons([H1, H2, H3 | T], [H1, X]) :-
    H2 =\= H1 + 1,
    remCons([H2, H3|T], X).


%
% 	                    |[], n = 0
% heterList(l1...ln) = 	|remConsecutive(l1) + heterList(l2...ln), is_list(l1) = True
% 	                    |l1 + heterList(l2...ln), otherwise

% heterList(L:list, R:list)
% flow model: heterList(i, o)

heterList([], []).
heterList([H|T], [HR|R]) :- 
    is_list(H), !,
    remCons(H, HR),
    heterList(T, R).
heterList([H|T], [H|R]) :-
    heterList(T, R).