; Задание №4

; Написать функцию, которая по своему списку-аргументу lst 
; определяет является ли он палиндромом (то есть равны ли lst и 
; (reverse lst)), для одноуровнего смешанного списка

; Идея функции -- получить список из 1 и 0, проверяя равны ли элементы списка и перевернутого списка
; Потом перемножить эти значения -- получили 1 значит палиндром, иначе нет

(
    defun is_palindrome (lst)
        (apply '* (mapcar (lambda (x y) (if (equal x y) 1 0)) lst (reverse lst)))
)

(
    defun is_palindrome_wrap (lst)
        (if (= (is_palindrome lst) 1) "Да, это палиндром" "Нет, не палиндром")
)

(print (is_palindrome_wrap '()))                   ; Да, это палиндром
(print (is_palindrome_wrap '(1 2 3 4 5)))          ; Нет, не палиндром
(print (is_palindrome_wrap '(-1 -2 -3)))           ; Нет, не палиндром
(print (is_palindrome_wrap '(1 2 1 2 1 1)))        ; Нет, не палиндром
(print (is_palindrome_wrap '(1 2 2 3 2 2 1)))      ; Да, это палиндром
(print (is_palindrome_wrap '(1 (2 1) (2 1) 1)))    ; Да, это палиндром

; Для Ардуино
(str (format nil "~a" (is_palindrome '())))                   ; 1
(str (format nil "~a" (is_palindrome '(1 2 3 4 5))))          ; 0
(str (format nil "~a" (is_palindrome '(-1 -2 -3))))           ; 0
(str (format nil "~a" (is_palindrome '(1 2 1 2 1 1))))        ; 0
(str (format nil "~a" (is_palindrome '(1 2 2 3 2 2 1))))      ; 1
(str (format nil "~a" (is_palindrome '(1 (2 1) (2 1) 1))))    ; 1