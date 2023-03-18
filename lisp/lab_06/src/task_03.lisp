; Задание 3

; Напишите рекурсивную функцию, которая умножает на заданное число-аргумент все
; числа из заданного списка-аргумента, когда
;   a) все элементы списка --- числа,
;   6) элементы списка -- любые объекты.

; a
(
    defun a_multiply_all (lst x)
        (if
            (null lst)
            nil
            (cons (* x (car lst)) (a_multiply_all (cdr lst) x))
        )
)

(print (a_multiply_all '() 2))                    ; nil
(print (a_multiply_all '(1 2 3 4 5) 2))           ; (2 4 6 8 10) 


; b
(
    defun b_multiply_all (lst x)
        (cond
            ((null lst) nil)
            ((not (numberp (car lst))) (cons (car lst) (b_multiply_all (cdr lst) x)) )
            (t (cons (* x (car lst)) (b_multiply_all (cdr lst) x)))
        )
)

(print (b_multiply_all '() 2))                    ; nil
(print (b_multiply_all '(1 2 3 4 5) 2))           ; (2 4 6 8 10) 
(print (b_multiply_all '(1 (2) 3 4 5) 2))         ; (2 (2) 6 8 10) 
(print (b_multiply_all '(1 (2) 3 "1" 5) 2))       ; (2 (2) 6 "1" 10) 