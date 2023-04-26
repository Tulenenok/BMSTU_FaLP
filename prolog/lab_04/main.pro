predicates 
    factorial(integer, integer).                        % Number, Result
    factorial_help_func(integer, integer, integer).     % Number, CurrentResult, Result
    
    fibbonachi(integer, integer).                                 % Number, Result
    fibbonachi_help_func(integer, integer, integer, integer).     % Number, Result, Start, End

clauses 
    % Нам нужна вспомогательная функция с текущей суммой (определим ее двумя предикатами)
    factorial_help_func(0, CurrentResult, Result) :-
        Result = CurrentResult, !.

    factorial_help_func(Number, CurrentResult, Result) :-
        Number > 0,
        NewResult = CurrentResult * Number,
        NewNumber = Number - 1,
        factorial_help_func(NewNumber, NewResult, Result).

    % Рассчет факториала
    factorial(Number, Result) :- 
        factorial_help_func(Number, 1, Result).


    fibbonachi_help_func(1, Result, _, End) :-
        Result = End.

    fibbonachi_help_func(2, Result, _, End) :-
        Result = End.

    fibbonachi_help_func(Number, Result, Start, End) :-
        Number > 2,
        NewNumber = Number - 1,
        NewEnd = Start + End,
        NewStart = End,
        fibbonachi_help_func(NewNumber, Result, NewStart, NewEnd).

    fibbonachi(Number, Result) :-
        fibbonachi_help_func(Number, Result, 1, 1).

goal 
    % factorial(5, Result).
    fibbonachi(1, Result).




