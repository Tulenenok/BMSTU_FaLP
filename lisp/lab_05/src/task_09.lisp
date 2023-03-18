; Пусть list-of-list список, состоящий из списков. Написать функцию, 
; которая вычисляет сумму длин всех элементов list-of-list 

(
    defun sum_length_lst (lst)
        (apply '+ (mapcar (lambda (l) (length l)) lst))
)

(print (sum_length_lst '()))                          ; 0
(print (sum_length_lst '( () () ())))                 ; 0
(print (sum_length_lst '( (1 2) () ())))              ; 2
(print (sum_length_lst '((1 2 3) (2 3))))             ; 5

; Для Ардуино
; (str (format nil "~a" (sum_length_lst '())))                          ; 0
; (str (format nil "~a" (sum_length_lst '( () () ()))))                 ; 0
; (str (format nil "~a" (sum_length_lst '( (1 2) () ()))))              ; 2
; (str (format nil "~a" (sum_length_lst '((1 2 3) (2 3)))))             ; 5