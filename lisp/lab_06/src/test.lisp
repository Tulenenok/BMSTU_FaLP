;; Пример хвостовой рекурсии для нахождения суммы элементов конечного списка

; (defun sum_tail (lst acc)
;   (if (null lst)
;       acc
;       (sum-tail (cdr lst) (+ acc (car lst)))))

; (print (sum_tail '(1 2 3 4 5) 0))               ; 15 


;; Пример взаимной рекурсии для определения четности числа
; (
;     defun is-even (n)
;         (if 
;             (= n 0)
;             t
;             (if 
;                 (= n 1)
;                 nil
;                 (is-odd (- n 1))
;             )
;         )
; )

; (
;     defun is-odd (n)
;         (if 
;             (= n 0)
;             nil
;             (if 
;                 (= n 1)
;                 t
;                 (is-even (- n 1))
;             )
;         )
; )

; (print (is-odd 1))      ; T
; (print (is-odd 2))      ; NIL
; (print (is-even 2))     ; T

; Пример дополняемое рекурсии для определения факториала числа
(
    defun factorial (n &optional (acc 1))
        (if 
            (<= n 1)
            acc
            (factorial (- n 1) (* n acc))
        )
)

(print (factorial 5))           ; 120 