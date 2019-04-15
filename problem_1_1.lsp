(defun prime (n)
	(if (= 1 n)
		(progn
			(format t "~a is not a prime number~%" n)
			(return-from prime)
		)
	)
	(if (= 2 n)
		(progn
			(format t "~a is a prime number~%" n)
			(return-from prime)
		)
	)
	(if (= 0 (mod n 2))
		(format t "~a is not a prime number~%" n)
		(do ((i 3 (+ i 2)))
			((>= i n) (format t "~a is a prime number~%" n))
			(if (= 0 (mod n i))
				(progn
					(format t "~a is not a prime number~%" n)
					(return-from prime)
				)
			)
		)
	)
)


(prime 2)
(prime 239)
(prime 999)
(prime 17)
				
