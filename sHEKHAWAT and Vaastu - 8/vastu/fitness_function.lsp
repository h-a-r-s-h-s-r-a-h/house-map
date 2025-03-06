
(defun fitness_function
	   (input / i j k selection x y value fitness arr16 max_fitness)

  (setq i 0)
  (setq max_fitness 80.0)
  (setq	arr16 (matrix))
		;| '(
		   (0 8 6 6 4 6 7 6 4 5 3 2 2 2 8 6)
		   (8 0 6 10 8 6 7 6 4 5 3 2 2 2 8 6)
		   (6 6 0 8 6 8 8 9 4 4 3 6 6 4 4 6)
		   (6 10 8 0 6 8 6 9 4 4 3 4 4 4 4 6)
		   (4 8 6 6 0 10 5 5 2 2 8 2 2 2 4 2)
		   (6 6 8 8 10 0 8 7 6 2 9 5 2 2 4 2)
		   (7 7 8 6 5  8 0 10 10 8 2 2 2 2 4 2)
		   (6 6 9 9 5 7 10 0 6 6 4 4 4 4 4 6)
		   (4 4 4 4 2 6 10 6 0 8 6 6 6 6 6 9)
		   (5 5 4 4 2 2 8 6 8 0 10 4 4 4 6 4)
		   (3 3 3 3 8 9 2 4 6 10 0 2 2 2 4 4)
		   (2 2 6 4 2 5 2 4 6 4 2 0 8 10 2 9)
		   (2 2 6 4 2 2 2 4 6 4 2 8 0 10 2 9)
		   (2 2 4 4 2 2 2 4 6 4 2 10 10 0 2 4)
		   (8 8 4 4 4 4 4 4 6 6 4 2 2 2 0 6)
		   (6 6 6 6 2 2 2 6 9 4 4 9 9 4 6 0)
		  )
  )|;
  (setq fitness 0)
  (setq greater_cond 0)

 

  (if (= (length input) 2)
	(progn

	          (setq var 0)
		  (while (< i (length input))
			(setq j 0)
		        
			(setq selection (nth i input))

			 ;Check if each elemnt has length greater than 1 and less than 5
			
		;	(if	(or (< (length selection) 2) (> (length selection) 4))
                ;(progn
			     ;      (setq fitness (- fitness 45))
			    ;)
			    ;(progn
					(while (< j  (length selection) )
					  (setq x (nth j selection))
					  
						(setq value (nth var (nth x arr16)))
						;(if	(= value 10)
						 ; (setq fitness (+ fitness (* value 1.5)))
						  (setq fitness (+ fitness value))
						;)
						(setq var (+ var 1))
					  
					  (setq j (+ j 1))
					)
			   ;)
			 ;)
			(setq i (+ i 1))
		  )
	  )
	  
	
	  (progn
	    (setq fitness 0)
	  )
  )


  (setq fitness (* (/ fitness max_fitness) 10))
 fitness
)
