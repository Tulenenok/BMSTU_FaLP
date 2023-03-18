; Задание №7

; Написать функцию, вычисляющую декартово произведение 
; двух своих списков-аргументов. (напомним, что А х В 
; это множество всевозможных пар (a b), где а 
; принадлежит А, принадлежит В)

(
    defun cartesian_product (lst1 lst2)
        (apply
            'append
            (mapcar (lambda (a) (mapcar (lambda (b) (list a b)) lst2)) lst1)
        )
)

(print (cartesian_product '() '()))             ; ()
(print (cartesian_product '(1) '(3)))           ; ((1 3)) 
(print (cartesian_product '(1 2) '(3 4)))       ; ((1 3) (1 4) (2 3) (2 4)) 
(print (cartesian_product '(1 2) '(3)))         ; ((1 3) (2 3)) 
(print (cartesian_product '(2) '(3 4)))         ; ((2 3) (2 4))  
(print (cartesian_product '() '(3 4)))          ; ()


; Для Ардуино
; (str (format nil "~a" (cartesian_product '() '())))             ; ()
; (str (format nil "~a" (cartesian_product '(1) '(3))))           ; ((1 3)) 
; (str (format nil "~a" (cartesian_product '(1 2) '(3 4))))       ; ((1 3) (1 4) (2 3) (2 4)) 
; (str (format nil "~a" (cartesian_product '(1 2) '(3))))         ; ((1 3) (2 3)) 
; (str (format nil "~a" (cartesian_product '(2) '(3 4))))         ; ((2 3) (2 4))  
; (str (format nil "~a" (cartesian_product '() '(3 4))))          ; ()