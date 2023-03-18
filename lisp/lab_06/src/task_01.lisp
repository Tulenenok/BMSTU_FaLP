; Задание 1

; Написать хвостовую рекурсивную функцию my-reverse, 
; которая развернет верхний уровень своего списка-аргумента lst

; С помощью append
(
    defun my_reverse1 (lst)
        (if
            (null lst) 
            nil
            (append (my_reverse1 (cdr lst)) (list (car lst)))
        )
)

(print (my_reverse1 '()))               ; NIL
(print (my_reverse1 '(1 2 3 4 5)))      ; (5 4 3 2 1)
(print (my_reverse1 '(1 (2 3) 4)))      ; (4 (2 3) 1) 


; Без append
(
    defun my_reverse2 (lst &optional (result ()))
        (if
            (null lst)
            result
            (my_reverse2 (cdr lst) (cons (car lst) result))
        )
)

(print (my_reverse2 '()))               ; NIL
(print (my_reverse2 '(1 2 3 4 5)))      ; (5 4 3 2 1)
(print (my_reverse2 '(1 (2 3) 4)))      ; (4 (2 3) 1) 