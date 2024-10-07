<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 2</b><br/>
"Рекурсія"<br/>
дисципліни "Вступ до функціонального програмування"
</p>
<p align="right">Студентка: Нестерук Анастасія Олександрівна група КВ-11<p>
<p align="right">Рік: 2024<p>
## Загальне завдання
Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за
можливості/необхідності використовуючи різні види рекурсії. Функції, які необхідно
реалізувати, задаються варіантом (п. 2.1.1). Вимоги до функцій:
1. Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового
списку, а не зміни наявного (вхідного).
2. Не допускається використання функцій вищого порядку чи стандартних функцій
для роботи зі списками, що не наведені в четвертому розділі навчального
посібника.
3. Реалізована функція не має бути функцією вищого порядку, тобто приймати функції
в якості аргументів.
4. Не допускається використання псевдофункцій (деструктивного підходу).
5. Не допускається використання циклів.
Кожна реалізована функція має бути протестована для різних тестових наборів. Тести
мають бути оформленні у вигляді модульних тестів (див. п. 2.3).
## Варіант <15>
1. Написати функцію spread-values , яка заміняє nil в списку на попередній не-
nil елемент:
  ```lisp
CL-USER> (spread-values ‘(nil 1 2 nil 3 nil nil 4 5))
(NIL 1 2 2 3 3 3 4 5)
```
2. Написати функцію delete-duplicates , яка видаляє всі послідовні дублікати тих
елементів з вхідного списку атомів, послідовних дублікатів яких більше за задане
число:
```lisp
CL-USER> (delete-duplicates '(1 1 2 3 3 3 2 2 a a a b) 3)
(1 1 2 3 2 2 A B)
```
## Лістинг функції <назва spread-values>
```lisp
(defun spread-values (list previous-value)
 (if(null list) 
    nil
 (if (null(car list))
	(cons previous-value(spread-values (cdr list) previous-value))
 	(cons (car list) (spread-values (cdr list) (car list))))))
```
### Тестові набори
```lisp
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
```
### Тестування
```lisp
CL-USER>  (test-spread-values)
Start testing spread-values function
test 1 passed! Expected: (NIL 1 2 2 3 3 3 4 5) Obtained: (NIL 1 2 2 3 3 3 4 5)
test 2 passed! Expected: (NIL NIL 6 6 6 7 7 7 7) Obtained: (NIL NIL 6 6 6 7 7 7
                                                            7)
test 3 passed! Expected: (9 9 0 0 0) Obtained: (9 9 0 0 0)
EnD
```
## Лістинг функції <назва другої функції>
```lisp
<Лістинг реалізації другої функції>
```
### Тестові набори
```lisp
<Лістинг реалізації тестових наборів другої функції>
```
### Тестування
```lisp
<Виклик і результат виконання тестів другої функції>
```
