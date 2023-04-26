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


    fibbonachi_help_func(Number, Result, Start, End) :-
        Number < 3,
        Result = End.

    fibbonachi_help_func(Number, Result, Start, End) :-
        NewNumber = Number - 1,
        Tmp = End,
        NewEnd = Start + End,
        NewStart = Tmp
        fibbonachi_help_func(NewNumber, Result, NewStart, NewEnd).

    fibbonachi(Number, Result) :-
        fibbonachi_help_func(Number, Result, 1, 1).

goal 
    % factorial(5, Result).
    fibbonachi(1, Result).




