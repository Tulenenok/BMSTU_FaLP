% библиотека ограничений на целые числа
:- use_module(library(clpfd)). 

fibonacci(N, Result) :- 
    fibonacci_helper(N, 0, 1, Result).

fibonacci_helper(0, A, _, A).
fibonacci_helper(N, A, B, Result) :-
    N #> 0,
    NextN #= N - 1,
    NextA #= B,
    NextB #= A + B,
    fibonacci_helper(NextN, NextA, NextB, Result).
