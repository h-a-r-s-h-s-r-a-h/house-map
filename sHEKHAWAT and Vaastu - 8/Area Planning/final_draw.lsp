
(setq room0 (list '("area" . 5)))

(setq room1 (list '("area" . 5)))

(setq room2 (list '("area" . 5)))

(setq room3 (list '("area" . 5)))

(setq room4 (list '("area" . 8)))

(setq room5 (list '("area" . 8)))

(setq room6 (list '("area" . 10)))

(setq room7 (list '("area" . 10)))

(setq room8 (list '("area" . 12)))

(setq room9 (list '("area" . 14)))

(setq room10 (list '("area" . 15)))

(setq room11 (list '("area" . 15)))

(setq room12 (list '("area" . 17)))

(setq room13 (list '("area" . 17)))

(setq room14 (list '("area" . 19)))

(setq room15 (list '("area" . 20)))



(defun final_draw()
  
  (setq temp (initiateGA))

  (foreach chromosome temp
     (foreach group chromosome
	   (foreach space group
            ;(princ space)

		    (setq space_string (vl-princ-to-string space))
		    (setq space_name (strcat "ROOM" space_string))
		 
		    (setq area (cdr (assoc "area" (eval (read space_name)))))
		    (princ area) (princ " ")
	   )
	 )

  )

)