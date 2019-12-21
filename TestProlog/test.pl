%					| 0 , X%Y = 0
%divisible(X, Y) = 	|
%					| divisible(X, Y+1), X > Y+1
%Flow model(i, i)
%divisible(X: Element, Y: Element)

divisible(X,Y) :- 0 is X mod Y, !.
divisible(X,Y) :- X > Y+1, divisible(X, Y+1).

%				| true, X = 2
%isPrime(X) = 	| false, X < 2
%				| !divisible(X, 2), otherwise
%Flow model(i)
%isPrime(X: Element)

isPrime(2) :- true,!.
isPrime(X) :- X < 2,!,false.
isPrime(X) :- not(divisible(X, 2)).

%						| [], n = 0
%primeList(l1..ln, R) =	| l1 * l1 U primeList(l2..ln, R), isPrime(l1)
%						| l1 U primeList(l2..ln, R), 	!isPrime(l1)
%
%Flow model(i, o)
%primeList(L: list, R: list)

primeList([], []) :- !.

primeList([H | T], [H2|R]) :-
    isPrime(H),
    H2 is H * H,
    primeList(T, R).
    
primeList([H | T], [H|R]) :-
    not(isPrime(H)),
    primeList(T, R).