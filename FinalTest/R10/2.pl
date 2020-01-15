%Method 1
subset([], []).
subset([H|T], [H|R]) :-
    subset(T, R).
subset([_|T], R) :-
    subset(T, R).

reverse([], []).
reverse([X], [X]).
reverse([H|T], R) :-
    reverse(T, Rt),
    append(Rt, [H], R), !.

suma([], 0).
suma([H|T], S) :-
    suma(T, S1),
    S is S1 + H.

onesol(L, S, R) :-
    subset(L, R),
    suma(R, S).

    
allsol(L, S, R) :-
    findall(RP, threeSol(L, S, RP), R).


%Method 2
minsert([],E,[E]).
minsert([H|T],E,[E,H|T]).
minsert([H|T],E,[H|Tr]):-
    minsert(T,E,Tr).

perm([],[]).
perm([H|T],R):-
    perm(T,Rt),
    minsert(Rt,H,R).

comb(_,0,[]).
comb([H|T],K,[H|Tr]):-
    K > 0,
    K1 is K - 1,
    comb(T,K1,Tr).
comb([_|T],K,R):-
    K > 0,
    comb(T,K,R).

arr(L,K,R):-
    comb(L,K,Rt),
    perm(Rt,R).

sum([],0).
sum([H|T],R):-
    sum(T,Rt),
    R is Rt + H.

onesol(L,K,S,R):-
    arr(L,K,R),
    sum(R,Rt),
    Rt =:= S.

allsol(L,K,S,R):-
    findall(Rt,onesol(L,K,S,Rt),R).