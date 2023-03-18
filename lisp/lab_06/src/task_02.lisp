; Задание 2

; Написать функцию, которая возвращает первый элемент списка-аргумента, 
; который сам является непустым списком.

(
    defun return_first_list (lst)
        (cond
            (
                (null lst)
                nil
            )
            (
                (and (not (atom (car lst))) (not (null (car lst))))  
                (car lst)
            )
            (
                t 
                (return_first_list (cdr lst))
            )
        )
)

(print (return_first_list '(1 ())))                 ; nil
(print (return_first_list '(1 2 3 4 5)))            ; nil
(print (return_first_list '((1 2) 3 4)))            ; (1 2)
(print (return_first_list '(1 2 (3 4))))            ; (3 4)
(print (return_first_list '(1 (2) (3 4))))          ; (2)
(print (return_first_list '(1 () (3 4))))           ; (3 4)