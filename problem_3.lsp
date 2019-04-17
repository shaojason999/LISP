(let ((input1 (open "file1.txt" :if-does-not-exist nil))
	(input2 (open "file2.txt" :if-does-not-exist nil))
	(count_list1 nil)(list2 nil)(ori_list1 nil)(ori_list2 nil)
	(longest_list nil))
	(when input2
		(loop for line = (read-line input2 nil)
			while line do
;			(format t "~a~%" line)
			(setf ori_list2 (cons line ori_list2))
		)
		(setf ori_list2 (reverse ori_list2))
	)
	(when input1
		(loop for line = (read-line input1 nil)
			while line do 
;			(format t "~a~%" line)
			(do ((i 0 (+ 1 i))(temp2 ori_list2)(temp1 NIL))
				((not temp2) (setf count_list1 (cons (reverse temp1) count_list1)))
				(if (equal line (car temp2))
					(progn
						(setf temp1 (cons i temp1))
					)
				)
				(setf temp2 (cdr temp2))
			)
			(setf ori_list1 (cons line ori_list1))
		)
		(setf count_list1 (reverse count_list1))
		(setf ori_list1 (reverse ori_list1))
	)
;	(format t "~a~%~a~%~a~%~a~%~%~%" ori_list1 ori_list2 count_list1 list2)

; find the longest matched lines(not includeing unmatched)
	(defun find_longest (local_list n)
		(let ((temp_list nil))
			(if (nthcdr n count_list1)
				(progn
					(setf temp_list (car (nthcdr n count_list1)))
					(find_longest local_list (+ n 1))
					(dolist (x temp_list)
						(if local_list
							(if (> x (car local_list))
								(progn
									(find_longest (cons x local_list) (+ n 1))
									(return)
								)
							)
							(progn
								(find_longest (cons x local_list) (+ n 1))
								(return)
							)
						)
					)
				)
				(progn
					(if (> (length local_list) (length longest_list))
						(setf longest_list local_list)
					)
				)
			)
		)
	)

	(find_longest NIL 0)
	(setf longest_list (reverse longest_list))
;	(format t "longest list: ~a~%" longest_list)

;print the result
	(let ((begin_list1 0)(begin_list2 0))
		(dolist (x longest_list)
			(do ((i begin_list1 (+ 1 i)))
				((equal (car(nthcdr i ori_list1)) (car(nthcdr x ori_list2)))(setf begin_list1 (+ 1 i)))
				(format t "-~a~%" (car(nthcdr i ori_list1)))
			)
			(loop for i from begin_list2 to (- x 1) do
				(format t "+~a~%" (car(nthcdr i ori_list2)))
			)
			(format t " ~a~%" (car(nthcdr x ori_list2)))
			(setf begin_list2 (+ x 1))
		)
		(loop for i from begin_list1 to (length ori_list1) do
			(if (car(nthcdr i ori_list1))
				(format t "-~a~%" (car(nthcdr i ori_list1)))
			)
		)
		(loop for i from begin_list2 to (length ori_list2) do
			(if (car(nthcdr i ori_list2))
				(format t "+~a~%" (car(nthcdr i ori_list2)))
			)
		)
	)

	(close input1)
	(close input2)

)
