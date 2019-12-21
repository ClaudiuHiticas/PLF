%1.
%a. Write a predicate to determine the lowest common multiple 
%of a list formed from integer numbers.
%b. Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th, … 
%element in a list.

%gcd(X: int, Y: int, Z: int)
%	compute the gcd between X and Y and store in Z
%	flow (i, i, o).

gcd(X, 0, X).
gcd(X, Y, Z) :- 
    number(X),
    number(Y),
    Mod is X mod Y,
    gcd(Y, Mod, Z).

%gcdList([H|T]: list, X: int)
%	compute the gcd from list and store in X
%	flow(i, o)

gcdList([], 0).
gcdList([X], X).

gcdList([H|T], X) :-
    gcdList(T, Y),
    gcd(H, Y, X).

%lcmList([H|T]: list, X: int)
%	compute the gcd from list and store in X
%	flow(i, o)

lcmList([], 0).
lcmList([X], X).

lcmList([H|T], X) :-
    gcdList(T, Y),
    gcd(H, Y, Z),
    X is (H * Y) / Z.

    
    
    