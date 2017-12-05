#!/usr/bin/swipl --consult-file

% BUBBLE SORT

is_sorted([]).
is_sorted([X | L]) :- is_sorted(L, X).

is_sorted([], _).
is_sorted([X | L], Y) :- Y < X, is_sorted(L, X).
is_sorted([X | L], Y) :- Y = X, is_sorted(L, X).

bubble_sort([], []).
bubble_sort([A | B], [A | B]) :- is_sorted([A | B]).
bubble_sort([A | B], X) :- \+ is_sorted([A | B]), b_sort(B, A, Y), bubble_sort(Y, X).

b_sort([], B, [B]).
b_sort([A | L], B, [A | X]) :- A < B, b_sort(L, B, X).
b_sort([A | L], B, [B | X]) :- B < A, b_sort(L, A, X).
b_sort([A | L], B, [B | X]) :- A = B, b_sort(L, B, X).

% MIDDLE ELEMENT

number_of_elements(0, []).
number_of_elements(X, [_ | L]) :- number_of_elements(Z, L), X is Z + 1.

middle_element(X, L) :- number_of_elements(A, L), B is A // 2, middle_element(X, L, B).
middle_element(_, [], _) :- false.
middle_element(Y, [Y | _], 0).
middle_element(Z, [_ | L], C) :- A is C - 1, middle_element(Z, L, A).

