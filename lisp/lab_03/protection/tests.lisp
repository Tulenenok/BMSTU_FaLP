(load "solver.lisp")

(
    defpackage test_package
    (:use :common-lisp :solver_package)
)

(in-package :test_package)

(
    defun
    test
    (i a b c result)
    (
        if 
        (equal (solver a b c) result)
        (print (format nil "TEST ~a ---> OK" i))
        (print  (format nil "TEST ~a ---> FAILURE           !!!" i))
    )
)

(test 1 "0" "0" "0" "Infinite number of solutions")
(test 2 "1" "0" "0" "Solution: x = 0.00")
(test 3 "0" "1" "0" "Solution: x = 0")
(test 4 "0" "0" "1" "No solution")

(test 5 "1" "7" "6" "Solutions: x1 = -6.00, x2 = -1.00")
(test 6 "1" "-2" "1" "Solution: x = 1.00")
(test 7 "3" "-4" "5" "Solutions: x1 = (4.00 + 6.63i) / 6,  x1 = (4.00 - 6.63i) / 6.00")