#!/usr/bin/swipl --consult-file

man(adam).
man(bart).
man(homer).
man(abraham).
man(clancy).
man(unknown_child).

woman(eva).
woman(mona).
woman(marge).
woman(meggie).
woman(liza).
woman(selma).
woman(patty).
woman(jacqueline).

%parent(parent, child)
parent(homer, bart).
parent(homer, liza).
parent(homer, meggie).
parent(abraham, homer).
parent(marge, bart).
parent(marge, liza).
parent(marge, meggie).
parent(mona, homer).
parent(jacqueline, marge).
parent(jacqueline, patty).
parent(jacqueline, selma).
parent(selma, unknown_child).

%husband(husband, husbandka)
husband(homer, marge).
husband(abraham, mona).
husband(clancy, jacqueline).

married_woman(Z) :- husband(_, Z), woman(Z).
married_man(M) :- husband(M, _), man(M).

matka(M, D) :- parent(M, D), woman(M).
otec(O, D) :- parent(O, D), man(O).

syn(S, R) :- parent(R, S), man(S).
dcera(D, R) :- parent(R, _), woman(D).

siblings(X, Y) :- parent(R, X), parent(R, Y), X \= Y.
sister(S, X) :- siblings(S, X), woman(S).
brother(B, X) :- siblings(B, X), man(B).

teta(T, X) :- parent(R, X), sister(T, R).
stryc(S, X) :- parent(R, X), brother(S, R).

cousin_man(B, X) :- man(B), parent(R1, B), parent(R2, X), siblings(R1, R2).
cousin_woman(S, X) :- woman(S), parent(R1, S), parent(R2, X), siblings(R1, R2).

father_in_law(T, X) :- man(T), parent(T, O), (husband(O, X); husband(X, O)).

father_in_law2(T, X) :- man(T), parent(T, O), husband(O, X).
father_in_law2(T, X) :- man(T), parent(T, O), husband(X, O).

% ELEMENT BELONGS IN A LIST

belongs(X, [X | _]).
belongs(X, [_ | R]) :- belongs(X, R).

% ELEMENT DOES NOT BELONGS IN A LIST

not_belongs(_, []).
not_belongs(X, [Y | R]) :- X \= Y, not_belongs(X, R).

% LENGTH OF A LIST

list_length([], 0).
list_length([_ | R], D) :- list_length(R, D1), D is D1 + 1.

list_length2([], 0).
list_length2([X | R], D) :- is_list(X), list_length2(R, D1), list_length2(X, D2), D is D1 + D2.
list_length2([X | R], D) :- atomic(X), list_length2(R, D1), D is D1 + 1.

% FREQUENCY OF AN ELEMENT

frequency(_, [], 0).
frequency(X, [Y | R], C) :- X = Y, frequency(X, R, C1), C is C1 + 1.
frequency(X, [Y | R], C) :- X \= Y, frequency(X, R, C).

% INSERT ELEMENT TO A LIST

insert(X, S, [X | S]).

insert2(X, [], [X]).
insert2(X, [Y | S1], [Y | S2]) :- insert2(X, S1, S2).
