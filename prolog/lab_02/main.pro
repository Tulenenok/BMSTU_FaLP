domains                     
    /* В разделе domains идет описание типов данных */

    % структура адреса
    city, street = symbol.
    house, flat = integer.

    address_struct = address(city, street, house, flat)

    % типы данных для базы знаний телефонный справочник
    surname = symbol.
    phone = integer.

    % типы данных для базы знаний автомобили
    model, color = symbol.
    price, year = integer.

    % типы данных для базы знаний банк
    bank = symbol.
    sum, account = integer.
    size = integer.

    % собственность может быть 4 типов
    ownership = building(price, address_struct)     ;
                area(price, size)                   ;
                water_transport(price, color)       ;
                car(price, model, color).

predicates 
    /* 
        Предикаты определяют отношения между объектами, 
        то есть используются для представления как фактов, так и правил.

        (
            для таких же тупеньких как я, подсказка: можно представить, 
            что это сигнатуры функций, то есть название и типы
        )
    */

    % телефонный справочник
    phone_record(surname, phone, address_struct).

    % банк
    depositor(surname, bank, account, sum).

    % собственность
    own(surname, ownership).

    get_price_ownership_use_surname(surname, symbol, price).
    sum_cost_inner(surname, symbol, price).
    sum_cost(surname, price).

clauses 
    /*
        Утверждения (аналог: тело основной программы)
    */

    % база знаний телефонный справочник
    phone_record(rich, 7771, address(london, green, 1, 10)).
    phone_record(rich, 7772, address(london, green, 1, 10)).
    phone_record(rich, 7773, address(moscow, green, 2, 20)).

    phone_record(middle, 5551, address(moscow, yellow, 3, 3)).

    phone_record(poor, 3331, address(ivanovka, red, 0, 0)).
    phone_record(poor, 3332, address(perm, blue, 10, 0)).

    
    % база знаний банк
    depositor(rich, gosbank, 10, 10000).
    depositor(rich, mosbank, 15, 20000).

    depositor(middle, gosbank, 17, 900).
    depositor(middle, mosbank, 20, 200).


    % база знаний собственность
    own(rich, building(100, address(kop, leet, 2, 53))).
    own(rich, area(10, 500)).
    own(rich, water_transport(1, green)).
    own(rich, car(5, mark1, red)).

    own(middle, car(3, mark2, green)).
    own(middle, building(90, address(moscow, ulk, 2, 32))).

    % Описываем правило, как по фамилии владельца найти цену его собственности
    get_price_ownership_use_surname(Surname_, building, Price_) :-
        own(Surname_, building(Price_, _)).

    get_price_ownership_use_surname(Surname_, area, Price_) :-
        own(Surname_, area(Price_, _)).

    get_price_ownership_use_surname(Surname_, water_transport, Price_) :-
        own(Surname_, water_transport(Price_, _)).

    get_price_ownership_use_surname(Surname_, car, Price_) :-
        own(Surname_, car(Price_, _, _)).


goal 
    /* 
        Тестовый запуск
        До выполнения задания можно задать такой вопрос 

        own(rich, Ownership).

        Если вы получили такой ответ, то ок:
            Ownership=building(100,address("kop","leet",2,53))
            Ownership=area(10,500)
            Ownership=water_transport(1,"green")
            Ownership=car(5,"mark1","red")
            4 Solutions
    */

    % own(rich, Ownership).




    /*
        1 задание: название всех объектов собственности по фамилии владельца
        Для этого будем использовать предикат get_name_price_ownership_use_surname

        get_price_ownership_use_surname(rich, Ownership, _).

        Результат:
            Ownership=building
            Ownership=area
            Ownership=water_transport
            Ownership=car
            4 Solutions
    */

    % get_price_ownership_use_surname(rich, Ownership, _).

    /*
        В рамках этого задания получим также все фамилии владельцов машин

        get_price_ownership_use_surname(Surname, car, _).

        Результат:
            Surname=rich
            Surname=middle
            2 Solutions
    */

    % get_price_ownership_use_surname(Surname, car, _).




     /*
        2 задание: название и стоимость всех объектов собственности по фамилии владельца
        Для этого будем использовать предикат get_name_price_ownership_use_surname

        get_price_ownership_use_surname(rich, Ownership, Price).

        Результат:
            Ownership=building, Price=100
            Ownership=area, Price=10
            Ownership=water_transport, Price=1
            Ownership=car, Price=5
            4 Solutions
    */

    % get_price_ownership_use_surname(rich, Ownership, Price).

    /*
        В рамках этого задания получим также все фамилии владельцов зданий

        get_price_ownership_use_surname(Surname, building, Price).

        Результат:
            Surname=rich
            Surname=middle
            2 Solutions
    */

    get_price_ownership_use_surname(Surname, building, Price).
