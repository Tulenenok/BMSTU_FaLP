predicates 
    factorial(integer, integer).                        % Number, Result
    factorial_help_func(integer, integer, integer).     % Number, CurrentResult, Result
    
    %fibbonachi(integer, integer).              % Number, Result

clauses 
    % Нам нужна вспомогательная функция с текущей суммой (определим ее двумя предикатами)
    factorial_help_func(0, CurrentResult Result) :-
        Result = CurrentResult.

    factorial_help_func(Number, CurrentResult, Result) :-
        Number > 0,
        NewResult = CurrentResult * Number,
        NewNumber = Number - 1,
        factorial_help_func(NewNumber, NewResult, Result).

    % Рассчет факториала максимально прост
    factorial(Number, Result) :- 
        factorial_help_func(Number, 1, Result).

goal 
    factorial(5, Result).




