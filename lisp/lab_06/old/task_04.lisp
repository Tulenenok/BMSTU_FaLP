(defun my_sort (lst)
	(cond ((null lst) Nil)
		(t (nconc 
			(my_sort (remove-if-not (lambda (x) (< (car lst) x)) (cdr lst)))
			(remove-if-not (lambda (x) (= (car lst) x)) lst)
			(my_sort (remove-if-not (lambda (x) (> (car lst) x)) (cdr lst)))
			)
		)
	)
)

(defun list_min (lst)
	(reduce 
		#'(lambda (a b) (cond ((< a b) a) (b)))
		lst
	)
)
(defun my_sort_inner (lst res)
	(cond 
		((null lst) res)
		(t (let* 
				(
					(cur_min (list_min lst))
					(lst_rest (remove cur_min lst :count 1))
				) 
				(my_sort_inner lst_rest (cons cur_min res))
			)
		)
	)
)

(defun my_sort (lst)
	(my_sort_inner lst ()))

(defun cut_upper (lst b)
	(cond 
		((null lst) Nil)
		((< (car lst) b) lst)
		(t (cut_upper (cdr lst) b))
	)
)
(defun cut_lower (lst a res)
	(cond 
		((null lst) res)
		((> a (car lst)) res)
		(t (cut_lower (cdr lst) a (cons (car lst) res)))
	)
)
(defun select-between-sorted (lst a b)	
	(cut_lower (cut_upper (my_sort lst) b) a ())	
)

(print (select-between-sorted '(0 3 7 6 5 4 1) 1 6))