; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ; Программа для решения квадратного уравнения  ;
; ;         a * x^2 + b * x + c = 0              ;
; ;                                              ;
; ; Гурова Н. ИУ7-64Б                            ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(
    defpackage solver_package
    (:use :common-lisp)
    (:export solver)
)

(in-package :solver_package)

; ПРЕДОПРЕДЕЛЕННЫЕ ПЕРЕМЕННЫЕ
(defvar OUTPUT_FILE "result.txt")

; ФУНКЦИИ
(
    ; Пользовательский ввод 
    defun 
    get_user_input (hint_stroke)
    (format t hint_stroke)
    (finish-output)
    (read-line)
)

(
    ; Проверяет, что строка является числом
    defun 
    is_number 
    (str)
    (ignore-errors (parse-integer str :junk-allowed t))
)

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
    ; Способ вывода результата
    defun
    my_print
    (data)
    (write_to_file OUTPUT_FILE data)
)

(
    ; Найти дискриминант b^2 - 4 * a * c
    defun find_d 
    (a b c) 
    (- (* b b) (* 4 a c))
)

(
    ; Содержательная часть поиска корней
    defun
    content_part
    (a b c)
    (
        ; Бесконечное количество решений
        if 
        (= 0 a b c)
        "Infinite number of solutions"
        (
            ; Нет решений, когда a = 0, b = 0 и с !- 0
            if 
            (= 0 a b)
            "No solution"
            (
                ; Единственное решение, когда a = 0, c = 0
                if 
                (= 0 a c)
                "Solution: x = 0"
                (
                    let ((d (find_d a b c)))
                    (
                        ; Одно решение, когда a = 0
                        if 
                        (= a 0)
                        (format nil "Solution: x = ~,2f" (/ (- c) b))
                        (
                            if 
                            (> d 0)
                            (format nil "Solutions: x1 = ~,2f, x2 = ~,2f" (/ (- (+ b (sqrt d))) (* 2 a)) (/ (- (- b (sqrt d))) (* 2 a)))
                            (
                                if 
                                (= d 0)
                                (format nil "Solution: x = ~,2f" (/ (- b) (* 2 a)))
                                (
                                    format nil 
                                    "Solutions: x1 = (~,2f + ~,2fi) / ~a,  x1 = (~,2f - ~,2fi) / ~,2f"
                                    (- b) (sqrt (- d)) (* 2 a) (- b) (sqrt (- d)) (* 2 a)
                                )
                            )
                        )
                    )
                )
            )
        )
    )
)

(
    defun 
        solver 
        (a b c)
        (
            ; Проверяем корректность введенных значени
            if
                (not (is_number a))
                "A invalid (need float number)"
                (
                if
                    (not (is_number b))
                    "B invalid (need float number)"
                    (
                    if
                        (not (is_number c))
                        "C invalid (need float number)"
                        (
                            let
                            (
                                (na (parse-integer a))
                                (nb (parse-integer b))
                                (nc (parse-integer c))
                            )
                            (content_part na nb nc)
                        )
                    )
                )
        )
)


; MAIN
(
    defun 
        main ()
        (delete_file OUTPUT_FILE)
        (create_file OUTPUT_FILE)

        (
            let 
            (
                (a (get_user_input "Enter a: "))
                (b (get_user_input "Enter b: "))
                (c (get_user_input "Enter c: "))
            )
            (my_print (solver a b c))
        )
  
        (print (format nil "Answer in file: ~a" OUTPUT_FILE))
)

(main)