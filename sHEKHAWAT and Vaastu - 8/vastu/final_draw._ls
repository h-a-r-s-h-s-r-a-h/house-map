
(defun final_draw()

  (princ "Inside")

  ;(princ (initiateGA))
  
  (setq temp (initiateGA))

  (foreach chromosome temp
     (foreach space chromosome
            (princ space)
	 )
	(princ "\n")
  )

)