#!/usr/bin/swipl --consult-file

% CONCAT A LIST

concat_list(S1, [], S1).
concat_list([], S2, S2).
concat_list([X | S1], S2, [X | S3]) :- concat_list(S1, S2, S3).

% FLIP A LIST

flip_list(S1, S2) :- flip_list(S1, S2, []).
flip_list([], Ak, Ak).
flip_list([X | S1], S2, AK) :- flip_list(S1, S2, [X | AK]).

% FACTORIAL

factorial(0, 1).
factorial(N, R) :- N > 0, Y is N - 1, factorial(Y, X), R is N * X.

% FIBONACCI

fibonacci(0, []).
fibonacci(N, [1 | X]) :- N > 0, fibonacci(1, N, X).
fibonacci(A, A, []).
fibonacci(A, B, [Y|X]) :- A < B, C is A + 1, fibonacci(C, B, X), fibonacci_helper(A, Y).

fibonacci_helper(0, 1).
fibonacci_helper(1, 1).
fibonacci_helper(N, R) :- N > 0, N1 is N - 1, N2 is N - 2, fibonacci_helper(N1, R1), fibonacci_helper(N2, R2), R is R1 + R2.

% SECOND MIN

second_min(L, B) :- second_min_helper(L, _, B).

second_min_helper([A, B], A, B) :- A < B.
second_min_helper([A, B], B, A) :- B < A.
second_min_helper([X | L], X, F) :- second_min_helper(L, F, _), X < F.
second_min_helper([X | L], F, X) :- second_min_helper(L, F, S), X < S.
second_min_helper([_ | L], F, S) :- second_min_helper(L, F, S).
