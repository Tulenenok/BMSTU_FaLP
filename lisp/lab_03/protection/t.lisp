(load "solver.lisp")

(defpackage test_package
  (:use :common-lisp :solver_package))

(in-package :test_package)

(ql:quickload "fiveam")

(fiveam:test solver-1
  (fiveam:is (equal "Infinite number of solutions" (solver "0" "0" "0"))) 
)

(fiveam:test solver-2
  (fiveam:is (equal "Solution: x = 0.00" (solver "1" "0" "0"))))

(fiveam:test solver-3
  (fiveam:is (equal "Solution: x = 0" (solver "0" "1" "0"))))

(fiveam:test solver-4
  (fiveam:is (equal "No solution" (solver "0" "0" "1"))))

(fiveam:test solver-5
  (fiveam:is (equal "Solutions: x1 = -6.00, x2 = -1.00" (solver "1" "7" "6"))))

(fiveam:test solver-6
  (fiveam:is (equal "Solution: x = 1.00" (solver "1" "-2" "1"))))

(fiveam:test solver-7
  (fiveam:is (equal "Solutions: x1 = (4.00 + 6.63i) / 6,  x1 = (4.00 - 6.63i) / 6.00" (solver "3" "-4" "5"))))

(fiveam:run!)