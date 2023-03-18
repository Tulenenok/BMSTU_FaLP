; Задание №5

; Используя функционалы, написать предикат set-equal, который 
; возвращает t, если два его множества-аргумента (одноуровневые списки) 
; содержат одни и те же элементы, порядок которых не имеет значения.

(
    defun is_first_equal_second (lst1 lst2)
        (apply '* (mapcar (lambda (x) (apply '+ (mapcar (lambda (y) (if (equal x y) 1 0)) lst2))) lst1))
)

(
    defun set_equal (lst1 lst2)
        (if (= 1 (is_first_equal_second lst1 lst2) (is_first_equal_second lst2 lst1)) "Эквивалентны" "Не эквивалентны")
)


(print (set_equal '(1 2 3) '(3 2 1)))                      ; Эквивалентны
(print (set_equal '(1 2 0 4 5) '(1 2 3 4 5 0)))            ; Не эквивалентны
(print (set_equal '(1 3 2 0 4 5) '(1 2 3 4 5 0)))          ; Эквивалентны



; Вариант с удалением, который не решает проблему задвоения
; (
;     defun is_first_equal_second (lst1 lst2)
;         (cond 
;             ((null lst1) (null lst2))
;             ((null lst2) nil)
;             (t (set_equal (cdr lst1) (remove (car lst1) lst2 :count 1)))
;         )
; )

; (
;     defun set_equal (lst1 lst2)
;         (if (equal (is_first_equal_second lst1 lst2) (is_first_equal_second lst2 lst1)) "Эквивалентны" "Не эквивалентны")
; )

; (print (set_equal '(1 2 3) '(3 2 1)))                      ; T
; (print (set_equal '(1 2 0 4 5) '(1 2 3 4 5 0)))            ; NIL
; (print (set_equal '(1 3 2 0 4 5) '(1 2 3 4 5 0)))          ; T
; (print (set_equal '(1 1 2) '(1 2)))                        ; T