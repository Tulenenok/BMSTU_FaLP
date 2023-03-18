; Задание 5

; Написать рекурсивную версию (с именем rec-add) вычисления суммы 
; чисел заданного списка:
;   а) одноуровнего смешанного,
;   б) структурированного

(
    defun a_rec_add (lst &optional (result 0))
        (cond
            ((null lst) result)
            ((numberp (car lst)) (a_rec_add (cdr lst) (+ result (car lst))))
            (t (a_rec_add (cdr lst) result))
        )
)

(print (a_rec_add '()))               ; 0
(print (a_rec_add '(1 2 3 4 5)))      ; 15
(print (a_rec_add '(1 (2) 3 4 5)))    ; 13


(
    defun b_rec_add (lst &optional (result 0))
        (cond
            ((null lst) result)
            ((numberp (car lst)) (b_rec_add (cdr lst) (+ result (car lst))))
            ((listp (car lst)) (+ (b_rec_add (car lst) 0) (b_rec_add (cdr lst) result)))
            (t (a_rec_add (cdr lst) result))
        )
)

(print (b_rec_add '()))                    ; 0
(print (b_rec_add '(1 2 3 4 5)))           ; 15
(print (b_rec_add '(1 (2) 3 4 5)))         ; 16
(print (b_rec_add '(1 (4) 3 4 5)))         ; 18
(print (b_rec_add '(1 (4) 3 "4" 5)))       ; 14
(print (b_rec_add '(1 (4 3) 3)))           ; 11
(print (b_rec_add '(1 (4 (3 5)) 3)))       ; 16