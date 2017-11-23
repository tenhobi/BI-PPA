#!/usr/bin/swipl --consult-file

spoj(S1, [], S1).
spoj([], S2, S2).
spoj([X | S1], S2, [X | S3]) :- spoj(S1, S2, S3).

otoc(S1, S2) :- otoc(S1, S2, []).
otoc([], Ak, Ak).
otoc([X | S1], S2, AK) :- otoc(S1, S2, [X | AK]).


%factorial(N, R) :- N = 0, R is 1.
factorial(0, 1).
factorial(N, R) :- N > 0, Y is N - 1, factorial(Y, X), R is N * X.


fib(0, []).
fib(N, [1 | X]) :- N > 0, fib(1, N, X).
fib(A, A, []).
fib(A, B, [Y|X]) :- A < B, C is A + 1, fib(C, B, X), fibonacci(A, Y).

fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(N, R) :- N > 0, N1 is N - 1, N2 is N - 2, fibonacci(N1, R1), fibonacci(N2, R2), R is R1 + R2.


secondmin(L, B) :- mymin(L, A, B).

mymin([A, B], A, B) :- A < B.
mymin([A, B], B, A) :- B < A.
mymin([X | L], X, F) :- mymin(L, F, S), X < F.
mymin([X | L], F, X) :- mymin(L, F, S), X < S.
mymin([X | L], F, S) :- mymin(L, F, S).
