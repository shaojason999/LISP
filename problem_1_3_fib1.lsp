(defun fib1 (n)
	(let ((a 0)(b 0))
		(if (= n 0)
			0
			(if (<= n 2)
				1
				(progn
					(setf a (fib1 (- n 1)))
					(setf b (fib1 (- n 2)))
					(+ a b)
				)
			)
		)
	)
)
