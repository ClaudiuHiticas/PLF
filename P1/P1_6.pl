%a. Write a predicate to test if a list is a set.
% 
% 					 	 |false , 	n = 0
% member(l1,..,ln, el) = |true ,		li = el
%  						 |member(l2,..ln, el), otherwise
%  						 
% member(L: list, el: int)
% Flow model (i, i)

member([H|_], H).
member([_|T], H):-
    member(T, H).

%
%					 |true, 		n = 0
% isSet(l1,...,ln) = |false, 	member(l1..ln, el) == true
%					 |isSet(l1..ln-1), otherwise
% isSet(L: list)
% Flow model (i)

isSet([]).
isSet([H|T]):-
    not(member(T, H)),
    isSet(T).
%isSet([1, 2, 3, 4]).
%isSet([1, 2, 1, 2]).

% b) Write a predicate to remove the first three occurrences of an element 
% in a list. If the element occurs less 
% than three times, all occurrences will be removed.
% 
%							| [], 		n = 0
% remove_k(l1...ln, e, k) = | l1..ln, 	k = 0
%							| remove_k(l2..ln, e, k-1), l1 = e
%							| remove_k(l2..ln, e, k), 	l1 != e
%							
% remove_k(L: list, E:int, K:int, R:list)
% remove_k(i, i, i, o)

remove_k([], _, _, []).
remove_k(L, _, 0, L).
remove_k([H|T], E, K, R) :- 
    H =:= E,
    K1 is K - 1,
    remove_k(T, E, K1, R).

remove_k([H|T], E, K, [H|R]) :- 
     H =\= E,
     remove_k(T, E, K, R).

% remove_3(L:list, E:number, R:list)
% Flow model(i, i, o)

remove_3(L, E, R) :- 
    remove_k(L, E, 3, R).
