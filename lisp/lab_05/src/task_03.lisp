; Задание №3

; Напишите функцию, которая умножает на заданное число-аргумент 
; все числа из заданного списка-аргумента, когда все 
; элементы списка --- числа, элементы списка -- любые объекты

(
    defun multiply_all_numbers (lst y)
        (mapcar (lambda (x) (if (numberp x) (* x y) x)) lst)
)

(print (multiply_all_numbers '() 1))                   ; NIL
(print (multiply_all_numbers '(1 2 3 4 5) 5))          ; (5 10 15 20 25)
(print (multiply_all_numbers '(-1 -2 -3) 5))           ; (-5 -10 -15) 
(print (multiply_all_numbers '("1" -2 (-3)) -2))       ; ("1" 4 (-3)) 