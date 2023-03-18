; Задание №1

; Напишите функцию, которая уменьшает на 10
; все числа из списка-аргумента этой функции, 
; проходя по верхнему уровню списковых ячеек. 

(
    defun reduce_it_by_10 (lst)
        (mapcar (lambda (x) (if (numberp x) (- x 10) x)) lst)
)

(print (reduce_it_by_10 '()))                   ; NIL
(print (reduce_it_by_10 '(1 2 3 4 5)))          ; (-9 -8 -7 -6 -5)
(print (reduce_it_by_10 '(1 (2) 3 "4" 5)))      ; (-9 (2) -7 "4" -5)

; Для Ардуино
; (str (format nil "~a" (reduce_it_by_10 '())))                   ; NIL
; (str (format nil "~a" (reduce_it_by_10 '(1 2 3 4 5))))          ; (-9 -8 -7 -6 -5)
; (str (format nil "~a" (reduce_it_by_10 '(1 (2)))))              ; (-9 (2))