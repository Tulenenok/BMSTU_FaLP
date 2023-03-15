(
    defun
    simple_option
    (x l)
    (
        cons (* (car l) x) (cdr l)
    )
)

(print (simple_option 5 '(1 2 3 4 5)))                 ; (5 2 3 4 5) 


(defvar l '((1) 2 3 4 5))
(defvar x 5)

(
    defun
    difficult_option
    (x l)
    (
        cond 
        ((null l) "Невозможно умножить (нет числовых значений)")
        ((numberp (car l)) (cons (* (car l) x) (cdr l)))
        (t (cons (car l) (difficult_option x (cdr l))))
    )
)

(print (difficult_option 5 '(1 2 3 4 5)))                 ; (5 2 3 4 5) 
(print (difficult_option 5 '((1) 2 3 4 5)))               ; ((1) 10 3 4 5) 
(print (difficult_option 5 '("1" (2 3 4) 5)))             ; ("1" (2 3 4) 25) 
(print (difficult_option 5 '("1" (2 3 4) (5))))           ; "Невозможно умножить (нет числовых значений)"