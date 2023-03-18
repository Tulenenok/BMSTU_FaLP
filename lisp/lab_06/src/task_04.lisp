; Задание 4

; Напишите функцию, select-between, которая из списка-аргумента, 
; содержащего только числа, выбирает только те, которые расположены 
; между двумя указанными границами-аргументами и возвращает их в виде списка

(
    defun get_numbers (lst start end result flag)
        (cond
            ((null lst) nil)
            ((= start (car lst)) (cons (car lst) (get_numbers (cdr lst) start end result 1))) 
            ((= end (car lst)) (cons (car lst) (get_numbers (cdr lst) start end result 0))) 
            ((= 1 flag) (cons (car lst) (get_numbers (cdr lst) start end result 1)))
            ((= 0 flag) (get_numbers (cdr lst) start end result 0))
        )
)

(
    defun select_between (lst start end)
        (get_numbers lst start end () 0)
)

; Сортировка
(
    defun put_elem_in_result (x result)
        (cond
            ((null result) (cons x result))
            ((<= x (car result)) (cons x result))
            (t (cons (car result) (put_elem_in_result x (cdr result))))
        )
)

(
    defun my_sort (lst &optional (result ()))
        (if
            (null lst)
            result
            (my_sort (cdr lst) (put_elem_in_result (car lst) result))
        )
)

; (print (my_sort '(5 4 3 2 1)))       ; (1 2 3 4 5)
; (print (my_sort '(5 14 3 12 1)))     ; (1 3 5 12 14) 

(print (select_between '(1 2 3 4 5 6) 1 6))               ; (1 2 3 4 5 6)
(print (select_between '(1 2 3 4 5 6) 2 4))               ; (2 3 4) 
(print (select_between '(10 2 5 4 1 9) 2 1))              ; (2 5 4 1)  

(print (my_sort (select_between '(10 2 5 4 1 9) 2 1)))    ; (2 5 4 1)  
(print (my_sort (select_between '(10 23 -5 4 1 9) -5 9))) ; (-5 1 4 9)   