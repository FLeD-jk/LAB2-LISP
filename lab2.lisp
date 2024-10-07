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


(defun my-delete-duplicates (lst n)
  (if (null lst) 
      nil
      (let ((first (car lst))          
            (next-rest (cdr lst)))    
        (if (and (not (null next-rest)) (equal first (car next-rest)))
            (let ((count (count-duplicates next-rest first 1))) 
              (if (>= count n) 
                  (let ((duplicates (drop-duplicates next-rest first)))
                  (cons first (my-delete-duplicates duplicates n))) 
                  (cons first (my-delete-duplicates next-rest n))))
            (cons first (my-delete-duplicates next-rest n))))))


(defun count-duplicates (lst first count)
  (if (null lst)
      count
      (if (equal first (car lst))
          (count-duplicates (cdr lst) first (+ count 1))  
          count)))

(defun drop-duplicates (lst first)
  (if (and (not (null lst)) (equal first (car lst)))
      (drop-duplicates (cdr lst) first)  
      lst))


(defun check-delete-duplicates (name input expected quantuity)
  "Execute spread-values on input, compare result with expected and print comparison status"
  (let ((result (my-delete-duplicates input quantuity)
    (format t "~:[~a failed! Expected: ~a Obtained: ~a~;~a passed! Expected: ~a Obtained: ~a~]~%"
            (equal result expected)
            name expected result)))


(defun test-delete-duplicates ()
 (format t "Start testing spread-values function~%")
(check-delete-duplicates "test 1" '(1 1 2 3 3 3 2 2 a a a b) '(1 1 2 3 2 2 A B) 3)
(check-delete-duplicates "test 2" '(nil nil 6 6 nil 7 nil nil nil) '(nil 6 nil 7 nil) 2)
(check-delete-duplicates "test 3" '(9 1 9 9 9 0 0 3 3 1 1 1 6) '(9 1 9 0 0 3 3 1 6) 3)
                       (format t "EnD~%"))

(test-delete-duplicates)
