(defun f (lst)
	(cond
		((null lst) Nil)
		(
			((lambda (x) (and (listp x) (listp (cdr x)) (not (null x)))) 
				(car lst))
			(car lst)
		)
		(t (f (cdr lst)))
	)
)

(print (f '(0 () (1 . 2) (2 3) (3) a)))