(defun tmp (lst result)
	(cond 
		((null lst) result)
		(t (tmp (cdr lst) (cons (car lst) result)))
	)
)

(defun my-reverse (lst)
	(tmp lst ())
)

(print (my-reverse '(1 a ((2 . 3) 5 6) 7 8)))