; Задание №6

; Напишите функцию, select-between, которая из списка-аргумента, содержащего только
; числа, выбирает только те, которые расположены между двумя указанными числами -
; границами-аргументами и возвращает их в виде списка (упорядоченного по
; возрастанию

; Обрезать слева, перевернуть, снова обрезать слева, снова перевернуть

(
    defun select_between (lst start end)
        (reverse
            (apply
                'append
                (maplist
                    (lambda (part_lst) (if (= (car part_lst) end) part_lst)) 
                    (reverse
                        (apply
                            'append
                            (maplist 
                                (lambda (part_lst) (if (= (car part_lst) start) part_lst)) 
                                lst
                            )
                        )
                    )
                )
            )
        )
)


(print (select_between '(1 2 3 4) 1 3))         ; (1 2 3) 
(print (select_between '(1 2 3 4) 2 3))         ; (2 3) 
(print (select_between '(1 2 3 4) 2 4))         ; (2 3 4)
(print (sort (select_between '(5 2 1 10 3 4 6) 2 4) #'<))  ; (1 2 3 4 10) 