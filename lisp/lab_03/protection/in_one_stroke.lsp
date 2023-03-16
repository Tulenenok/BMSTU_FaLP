; Рудимент, не обернутый в функцию код 
; Нужно смотреть файл solver.lisp


; ВХОДНЫЕ ПАРАМЕТРЫ

; (defvar a 1)
; (defvar b 0)
; (defvar c 0)

(defvar a 1)
(defvar b 7)
(defvar c 6)

; (defvar a 1)
; (defvar b 2)
; (defvar c 3)

; (defvar a 1)
; (defvar b -2)
; (defvar c 1)

; (defvar a 3)
; (defvar b -4)
; (defvar c 5)


; ФУНКЦИИ
(
    ; Функция добавляет в файл текст (файл уже должен существовать)
    defun 
        write_to_file 
        (filename data)
        (with-open-file (stream filename :direction :output :if-exists :append)
        (write-line data stream))
)

(
    ; Функция удаляет файл
    defun 
    delete_file 
    (filename)
    (ignore-errors (delete-file filename))
)

(
    ; Функция создает файл (пустой)
    defun 
    create_file 
    (filename)
    (with-open-file (stream filename :direction :output :if-exists :error :if-does-not-exist :create)
    (format stream ""))
)

(
    defun
    my_print
    (data)
    (write_to_file "out.txt" data)
)

(
    ; Обертка для проверки на корректность числа
    defun
    is_correct_number
    (x ok_stroke not_ok_stroke)
    (
        if
        (numberp x)
        (my_print ok_stroke)
        (and (my_print not_ok_stroke) (exit))
    )
)

(
    ; Найти дискриминант b^2 - 4 * a * c
    defun find_d 
    (a b c) 
    (- (* b b) (* 4 a c))
)

; MAIN

; Чистим предыдущий файл с результатом
(delete_file "out.txt")
(create_file "out.txt")

; Проверяем корректность введенных значений
(is_correct_number a "A valid" "A invalid (need float number)")
(is_correct_number b "B valid" "B invalid (need float number)")
(is_correct_number c "C valid" "C invalid (need float number)")


; Бесконечное количество решений
(
    if 
    (and (= a 0) (= b 0) (= c 0))
    (and (my_print "infinite number of solutions") (exit))
)

; Нет решений, когда a = 0, b = 0 и с !- 0
(
    if 
    (= 0 a b)
    (and (my_print "No solution") (exit))
)

; Единственное решение, когда a = 0, c = 0
(
    if 
    (= 0 a c)
    (and (my_print "Solution: x = 0") (exit))
)

; Одно решение, когда a = 0
(
    if 
    (= a 0)
    (and (my_print (format nil "Solution: x = ~a" (/ (- c) b))) (exit))
)

; Основная часть

(defvar d (find_d a b c))                       ; Нашли дискриминант
(defvar sqrt_d (sqrt (if (< d 0) (- d) d)))     ; Нашли корень из дискриминанта

(defvar 2a (* 2 a))

(
    if 
    (> d 0)
    (my_print (format nil "Solutions: x1 = ~a, x2 = ~a" (/ (- (+ b sqrt_d)) 2a) (/ (- (- b sqrt_d)) 2a)))
    (
        if 
        (= d 0)
        (my_print (format nil "Solution: x = ~a" (/ (- b) 2a)))
        (
            my_print (
                format nil 
                "Solutions: x1 = (-~a + ~ai) / ~a,  x1 = (-~a - ~ai) / ~a"
                (- b) sqrt_d 2a (- b) sqrt_d 2a 
            )
        )
    )
)