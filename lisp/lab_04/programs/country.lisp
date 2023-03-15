(
     defvar country_table
     '(
        (Россия . Москва)
        (Англия . Лондон)
        (Италия . Рим)
        (Испания . Мадрид)
     )
)

(
    defun
    get_country_by_capital
    (capital table)
    (
        cond 
            ((null table) "Не найдено")
            ((equal (cdr (car table)) capital) (car (car table)))
            (t (get_country_by_capital capital (cdr table)))
    )
)

(
    defun
    get_capital_by_country
    (country table)
    (
        cond 
            ((null table) "Не найдено")
            ((equal (car (car table)) country) (cdr (car table)))
            (t (get_capital_by_country country (cdr table)))
    )
)

(
    defun
    get_by_value
    (value table)
    (
        if
        (equal "Не найдено" (get_country_by_capital value table))
        (get_capital_by_country value table)
        (get_country_by_capital value table)
    )
)

(print (get_country_by_capital 'ФФФФ country_table))
(print (get_country_by_capital 'МОСКВА country_table))
(print (get_country_by_capital 'ЛОНДОН country_table))
(print (get_country_by_capital 'МАДРИД country_table))

(print (get_capital_by_country 'ФФФФ country_table))
(print (get_capital_by_country 'РОССИЯ country_table))
(print (get_capital_by_country 'АНГЛИЯ country_table))
(print (get_capital_by_country 'ИСПАНИЯ country_table))

(print (get_by_value 'FFF country_table))
(print (get_by_value 'Рим country_table))
(print (get_by_value 'Италия country_table))