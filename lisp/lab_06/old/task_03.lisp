(defun mult1 (lst num)
	(cond
		((null lst) Nil)
		(t (cons (* (car lst) num) (mult1 (cdr lst) num)))
	)
)

(print (mult1 '(0 10 -10 5.5 2/3) 2))

(defun mult2 (lst num)
	(cond 
		((null lst) Nil)
		((numberp (car lst)) (cons (* (car lst) num) (mult2 (cdr lst) num)))
		(t (cons (car lst) (mult2 (cdr lst) num)))
	)
)	

(print (mult2 '(0 a "abc" (1 k) 2/3 ((1 . 2) . 3)) 2))