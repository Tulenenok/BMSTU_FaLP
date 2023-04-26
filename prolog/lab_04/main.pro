predicates 
    factorial(integer, integer).        % Number, Result

    %fibbonachi(integer, integer).       % Number, Result

clauses 
    factorial(0, Result) :- 
        Result = 1.

    factorial(Number, Result) :- 
        Number > 0,
        NextNumber = Number - 1,
        factorial(NextNumber, Result),
        Result = Result * Number.

goal 
    factorial(5, Result).




