; Задание №2

; Написать функцию которая получает как аргумент список чисел, 
; а возвращает список квадратов этих чисел в том же порядке

(
    defun squares_of_numbers (lst)
        (mapcar (lambda (x) (* x x)) lst)
)

(print (squares_of_numbers '()))                   ; NIL
(print (squares_of_numbers '(1 2 3 4 5)))          ; (1 4 9 16 25) 
(print (squares_of_numbers '(-1 -2 -3)))           ; (1 4 9)


; Для Ардуино
; (str (format nil "~a" (squares_of_numbers '())))                   ; NIL
; (str (format nil "~a" (squares_of_numbers '(1 2 3 4 5))))          ; (1 4 9 16 25) 
; (str (format nil "~a" (squares_of_numbers '(-1 -2 -3))))           ; (1 4 9)