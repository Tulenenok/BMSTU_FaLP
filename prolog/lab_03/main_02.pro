DOMAINS
    num = integer.

PREDICATES
    max2(num, num, num).
    max2cut(num, num, num).
    max3(num, num, num, num).
    max3cut(num, num, num, num).

CLAUSES
    max2(N1, N2, N2) :- 
        N2 >= N1.

    max2(N1, N2, N1) :-
        N1 >= N2

    /* 
        Первое правило говорит, что если N2 больше или равно N1, 
        то Max равен N2. При этом используется особый символ ! (кат), 
        который в данном случае означает отсечение (cut). 
        Он используется для оптимизации работы программы и позволяет 
        избежать повторных вычислений, когда уже найдено решение.
    */
    max2cut(N1, N2, N2) :-
        N2 >= N1, !.

    /* Второе правило говорит, что во всех остальных случаях, Max равен N1. */
    max2cut(N1, _, N1).

    max3(N1, N2, N3, N3) := 
        N3 >= N1, 
        N3 >= N2.

    max3(N1, N2, N3, N2) := 
        N2 >= N1, 
        N2 >= N3.

    max3(N1, N2, N3, N1) := 
        N1 >= N2, 
        N1 >= N3.


    max3cut(N1, N2, N3, N3) := 
        N3 >= N1, 
        N3 >= N2, !.

    max3cut(N1, N2, _, N2) := 
        N2 >= N1, !.

    max3cut(N1, _, _, N1).

GOAL
    max2(1, 2, Max).

    max2(2, 1, Max).

    max2cut(1, 2, Max).

    max2cut(2, 1, Max).

    max3(1, 2, 3, Max).

    max3(1, 3, 2, Max).

    max3(3, 1, 2, Max).

    max3cut(1, 2, 3, Max).

    max3cut(1, 3, 2, Max).

    max3cut(3, 1, 2, Max).
