%Add 1 on odds positions
add([], [], _).

add([H|T], R, I) :-
    X is I mod 2,
    X = 1,
    I1 is I + 1,
    add(T, R1, I1),
    R = [H|R1].

add([H|T], R, I) :-
    X is I mod 2,
    X = 0,
    I1 is I + 1,
    add(T, R1, I1),
    R = [H|[1|R1]].