% 1. Numarul de aparitii al unui element intr-o lista, folosind metoda 
% variabilei colectoare.

nOcc([], _, 0).

nOcc([E], E, 1).

nOcc([E|T], E, K) :-
    nOcc(T, E, K1),
    K is K1 + 1.

nOcc([_|T], E, K) :-
    nOcc(T, E, K).
    
% 2. Inversarea unui numar, folosind metoda variabilei colectoare.

inv(0, C, C).

inv(N, C, X):-
    UC is N mod 10,
    N1 is (N-UC) / 10,
    C1 is C * 10 + UC,
    inv(N1, C1, X).
    
% 3. Se da o lista de numere si liste de numere. 
% Se cere ca din fiecare sublista sa se stearga numerele palindroame.
% L = [[2, 33, 122], 22, 33, 17, [121, 43, 575], [535]] =>
% 	R = [[122], 22, 33, 17, [43], []]

inv(0, C, C).

inv(N, C, X):-
    UC is N mod 10,
    N1 is (N-UC) / 10,
    C1 is C * 10 + UC,
    inv(N1, C1, X).
    
palList([], []).
palList([H|T], [H|R]) :-
    inv(H, 0, X),
    X =\= H, !, 
    palList(T, R).
    
palList([_|T], R) :-
    palList(T, R).

mainHeter([], []).
mainHeter([H|T], [H|R]) :- number(H),
    mainHeter(T, R).
mainHeter([H|T], [HR|R]) :- is_list(H),
    palList(H, HR),
    mainHeter(T, R).