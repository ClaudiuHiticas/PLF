%Seminary 2 - Prolog


% 1. Multiply elements of a list with a constant value
% L = [2, 3, 4, 1], k = 2   =>  R = [4, 6, 8, 2]

multiply([], _, []).

multiply([H1|T1], K, [H2|T2]) :-
    H2 is H1 * K,
    multiply(T1, K, T2).

% 2. Add an element at the end of a list

addEl([], El, [El]).

addEl([H|T], El, [H|R]):-
    addEl(T, El, R).

% 3. Compute number of occurrences of an element in a list.

occ([], _, 0).

occ([H|T], El, K) :-
    El =:= H,
    occ(T, El, K1),
    K is K1 + 1.

occ([H|T], El, K) :-
    El =\= H,
    occ(T, El, K).


% 4.Eliminate all elements with just one occurrence from a list.

%oneOcc([], []).

%oneOcc([H|T], R) :-
%    occ(T, H, K),
%    K =:= 0,
%    oneOcc(T, R).

%oneOcc([H|T], R) :-
%    occ(T, H, K),
%    K =\= 0,
%    oneOcc(T, R1),
%    R is [H, R1].

remUniq([], _, []).

remUniq([H|T], X, Y) :-
    remUniq(T, X, Y1),
    occ(X, H, K),
    (K =\= 1 ->  
    Y = [H|Y1];
    Y = Y1).
   
dup(X, Y) :-
    remUniq(X, X, Y).