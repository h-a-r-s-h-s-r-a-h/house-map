(defun yr()
(setq lis_s nil)
(setq lis_s (cons (list 0 1) lis_s))
  (setq lis_s (append lis_s (list (list 0 1) (list 0 5) (list 0 5))))
(setq tem nil)
  (setq i 0)
  (while (< i (length lis_s))
    (setq a (nth i lis_s))
    (setq j (+ i 1))
  (setq te 0)
  (while (< j (length lis_s))
      (setq b (nth j lis_s))
      (if (equal a b)
	  (setq te 1)
	)
    (setq j (+ j 1))
    )
	(if (= te 0)
	  (setq tem (append tem(list a)))
	  )
    (setq i (+ i 1))
  )
  (setq lis_s tem)
  )