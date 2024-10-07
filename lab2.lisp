(defun spread-values (list previous-value)
 (if(null list) 
    nil
 (if (null(car list))
	(cons previous-value(spread-values (cdr list) previous-value))
 	(cons (car list) (spread-values (cdr list) (car list))))))

(defun check-spread-values (name input expected)
  "Execute spread-values on input, compare result with expected and print comparison status"
  (let ((result (spread-values input nil))) 
    (format t "~:[~a failed! Expected: ~a Obtained: ~a~;~a passed! Expected: ~a Obtained: ~a~]~%"
            (equal result expected)
            name expected result)))


(defun test-spread-values ()
 (format t "Start testing spread-values function~%")
(check-spread-values "test 1" '(nil 1 2 nil 3 nil nil 4 5) '(nil 1 2 2 3 3 3 4 5))
(check-spread-values "test 2" '(nil nil 6 6 nil 7 nil nil nil) '(nil nil 6 6 6 7 7 7 7))
(check-spread-values "test 3" '(9 nil 0 nil 0) '(9 9 0 0 0))
                       (format t "EnD~%"))
    
 (test-spread-values)
