					; Grouping algorithm

					;input the adjacency list as in the module access


;|(setq input_list
       (list (list 14 0 -1)
	     (list 14 1 -1)
	     (list 8 15 -1)
	     (list 2 7 -1)
	     (list 3 7 -1)
	     (list 0 6 -1)
	     (list 1 6 -1)
	     (list 12 13 -1)
	     (list 11 13 -1)
	     (list 10 9 -1)
	     (list 5 6 -1)
	     (list 4 7 -1)
       )
)|;

(defun grouping	(input_list / j element group)
					;(setq stopping_condition 0)
  (setq start 0)
  (setq chromosome nil)
  (while (< start (length input_list))
    (setq temp_group nil)
    (setq group (nth start input_list))
    (if	(= (nth 2 group) -1)
      (progn
	(setq temp_group
	       (append temp_group
		       (list (nth 0 group))
	       )
	)
	(setq temp_group
	       (append temp_group
		       (list (nth 1 group))
	       )
	)

	(foreach g input_list
	  (if (= g (nth start input_list))
	    (progn (setq value (replace-n 0 2 g))
		   (setq input_list (replace-n value start input_list))
	    )
	  )
	)
	(setq j 0)
	(while (< j (length temp_group))
	  (setq element (nth j temp_group))
	  (find_and_fix element)
	  (setq j (+ j 1))
	)
	(setq temp_group (unique temp_group))
	(setq chromosome (append chromosome (list temp_group)))
	;(princ input_list)
	;(princ "\n")
      )
    )
    (setq start (+ start 1))
  )
  (princ chromosome)
  (princ)
)





(defun find_and_fix (ele / i group)
					
  (setq i (+ start 1))
  (while (< i (length input_list))
					
    (setq group (nth i input_list))
    (if	(= (nth 2 group) -1)
      (progn
	(if (= ele (nth 0 group))
	  (progn
	    (setq temp_group
		   (append temp_group (list (nth 1 group)))
	    )

	    (foreach g input_list
	      (if (= g (nth i input_list))
		(progn (setq value (replace-n 0 2 g))
		       (setq input_list (replace-n value i input_list))
		)
	      )
	    )
	  )
	)
	(if (= ele (nth 1 group))
	  (progn
	    (setq temp_group
		   (append temp_group (list (nth 0 group)))
	    )
	    (foreach g input_list
	      (if (= g (nth i input_list))
		(progn (setq value (replace-n 0 2 g))
		       (setq input_list (replace-n value i input_list))
		)
	      )
	    )
	  )

	)
      )
    )
    (setq i (+ i 1))
  )
					;(setq temp_group (reverse temp_group))
)




(defun replace-n (new n lst /)
  (mapcar '(lambda (a)
	     (if
	       (= (setq n (1- n)) -1)
		new
		a
	     )
	   )
	  lst
  )
)

(defun unique ( l / x r )
    (while l
        (setq x (car l)
              l (vl-remove x (cdr l))
              r (cons x r)
        )
    )
    (reverse r)
)