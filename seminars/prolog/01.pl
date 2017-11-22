#!/usr/bin/swipl --consult-file

muz(adam).
muz(bart).
muz(homer).
muz(abraham).
muz(clancy).
muz(nezname_dite).

zena(eva).
zena(mona).
zena(marge).
zena(meggie).
zena(liza).
zena(selma).
zena(patty).
zena(jacqueline).

%rodic(rodic, dite)
rodic(homer, bart).
rodic(homer, liza).
rodic(homer, meggie).
rodic(abraham, homer).
rodic(marge, bart).
rodic(marge, liza).
rodic(marge, meggie).
rodic(mona, homer).
rodic(jacqueline, marge).
rodic(jacqueline, patty).
rodic(jacqueline, selma).
rodic(selma, nezname_dite).

%manzel(manzel, manzelka)
manzel(homer, marge).
manzel(abraham, mona).
manzel(clancy, jacqueline).

vdana(Z) :- manzel(_, Z), zena(Z).
zenaty(M) :- manzel(M, _), muz(M).

matka(M, D) :- rodic(M, D), zena(M).
otec(O, D) :- rodic(O, D), muz(O).

syn(S, R) :- rodic(R, S), muz(S).
dcera(D, R) :- rodic(R, _), zena(D).

sourozenci(X, Y) :- rodic(R, X), rodic(R, Y), X \= Y.
sestra(S, X) :- sourozenci(S, X), zena(S).
bratr(B, X) :- sourozenci(B, X), muz(B).

teta(T, X) :- rodic(R, X), sestra(T, R).
stryc(S, X) :- rodic(R, X), bratr(S, R).

bratranec(B, X) :- muz(B), rodic(R1, B), rodic(R2, X), sourozenci(R1, R2).
sestrenice(S, X) :- zena(S), rodic(R1, S), rodic(R2, X), sourozenci(R1, R2).

tchan(T, X) :- muz(T), rodic(T, O), (manzel(O, X); manzel(X, O)).

tchan2(T, X) :- muz(T), rodic(T, O), manzel(O, X).
tchan2(T, X) :- muz(T), rodic(T, O), manzel(X, O).

nalezi(X, [X | _]).
nalezi(X, [_ | R]) :- nalezi(X, R).

nenalezi(_, []).
nenalezi(X, [Y | R]) :- X \= Y, nenalezi(X, R).

delka([], 0).
delka([_ | R], D) :- delka(R, D1), D is D1 + 1.

delka2([], 0).
delka2([X | R], D) :- is_list(X), delka2(R, D1), delka2(X, D2), D is D1 + D2.
delka2([X | R], D) :- atomic(X), delka2(R, D1), D is D1 + 1.

cetnost(X, [], 0).
cetnost(X, [Y | R], C) :- X = Y, cetnost(X, R, C1), C is C1 + 1.
cetnost(X, [Y | R], C) :- X \= Y, cetnost(X, R, C).

vloz(X, S, [X | S]).

vloz2(X, [], [X]).
vloz2(X, [Y | S1], [Y | S2]) :- vloz2(X, S1, S2).
