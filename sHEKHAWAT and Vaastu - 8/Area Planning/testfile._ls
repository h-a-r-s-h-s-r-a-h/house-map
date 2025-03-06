(defun ab()
 ;| (setq ci 0)
  (setq li 0)
  (setq index1 0)
  (setq index2 0)
  (setq initial_population(numberofchromosomes 100))
(princ (length initial_population))
  (while (< li 10)
    (princ li)
        (setq generated_offsprings nil)	  
	(foreach ele initial_population
            (while (= index1 index2)
			  
	          (setq index1 (fix (* (length initial_population) (randnum))))
		      (setq index2 (fix (* (length initial_population) (randnum))))
			)

			(setq parent1 (nth index1 initial_population))
		    (setq parent2 (nth index2 initial_population))

					 
            
  
				
			    ;(princ "Parent 1")(princ parent1)(princ "\n")
			    ;(princ "parent 2")(princ parent2)(princ "\n")
			  
		        (setq temp_list (crossover (list parent1 parent2)))   ;calling the crossover function
			  
		    
           (setq generated_offsprings(append generated_offsprings(list (nth 0 temp_list) (nth 1 temp_list))))
	)

	      
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  (setq offsprings nil)
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  
		    (setq offsprings(append offsprings(list  (mutation chromosome))))
		 
	    )
	;  (if(< rndn mutation_probability)
	(setq generated_offsprings offsprings)
         ;)
	
    (setq initial_population generated_offsprings)
    (foreach ele generated_offsprings
              (princ "\n")(princ (nth 1 ele))
      )
	   
(setq li (+ li 1))
     )|;;((0 10 13 8) (7 15 5 4) (1 6 12 9) (2 14 11 3))((0 10 13) (8 7 15) (5 4 1) (6 12 9 2) (14 11 3))
  (setq group_g (list (list 0 10 13 8)(list 7 15 5 4)(list 1 6 12 9) (list 2 14 11 3)  ))
  (setq bays (list (list 0 10 13) (list 8 7 15) (list 5 4 1) (list 6 12 9 2) (list 14 11 3)))
  (setq lis nil)

   (setq i 0)
  (setq elem 0)(setq lis nil)
  (while (< i (length group_g))
    (setq j 0)
    (while (< j (length bays))
        ;|  (if (and (= (rem i 2) 0)(= (rem j 2) 1))
	           (progn
		         (if (or (= (nth 0 (nth i group_g))(nth 0 (nth j bays)))(= (nth 0 (nth i group_g))(nth 1 (nth j bays))))
			   (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     
		    
		     (if (or (= (nth 3 (nth i group_g))(nth 3 (nth j bays)))(= (nth 3 (nth i group_g))(nth 2 (nth j bays))))
			       (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     )
	    )
      (if (and (= (rem i 2) 0)(= (rem j 2) 0))
	           (progn
		        
		     (if (or (= (nth 3 (nth i group_g))(nth 1 (nth j bays)))(= (nth 3 (nth i group_g))(nth 0 (nth j bays))))
			     (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		      (if (or (= (nth 0 (nth i group_g))(nth 2 (nth j bays)))(= (nth 0 (nth i group_g))(nth 3 (nth j bays))))
			       (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     
		    
		     )
	    )
      (if (and (= (rem i 2) 1)(= (rem j 2) 0))
	           (progn
		         (if (or  (= (nth 0 (nth i group_g))(nth 0 (nth j bays)))(= (nth 0 (nth i group_g))(nth 1 (nth j bays))))
			     (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     
		     (if (or (= (nth 3 (nth i group_g))(nth 3 (nth j bays)))(= (nth 3 (nth i group_g))(nth 2 (nth j bays))))
			       (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     )
	    )
      (if (and (= (rem  i 2) 1)(= (rem j 2) 1))
	           (progn
		         
		     (if (or (= (nth 3 (nth i group_g))(nth 1 (nth j bays)))(= (nth 3 (nth i group_g))(nth 0 (nth j bays))))
			      (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     
	            (if (or  (= (nth 0 (nth i group_g))(nth 2 (nth j bays)))(= (nth 0 (nth i group_g))(nth 3 (nth j bays))))
			     (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		   
	)
	    )
      (setq j (+ j 1))
      )
    (setq i (+ i 1))
    )|;
 ; (setq fitness 100.0)
 ;(setq fitness (- fitness (* (/ elem 12.0) 100.0)))
  ;  fitness
  
    
          (if (and (= (rem i 2) 0)(= (rem j 2) 1))
	           (progn
		         (if (or (= (nth 0 (nth i group_g))(nth 0 (nth j bays)))(= (nth 0 (nth i group_g))(nth 1 (nth j bays))))
			   (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		      (if (or (= (nth 1 (nth i group_g))(nth 0 (nth j bays)))(= (nth 1 (nth i group_g))(nth 1 (nth j bays))))
			   (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     (if (or (= (nth 2 (nth i group_g))(nth 3 (nth j bays)))(= (nth 2 (nth i group_g))(nth 2 (nth j bays))))
			       (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		    
		     (if (or (= (nth 3 (nth i group_g))(nth 3 (nth j bays)))(= (nth 3 (nth i group_g))(nth 2 (nth j bays))))
			       (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     )
	    )
      (if (and (= (rem i 2) 0)(= (rem j 2) 0))
	           (progn
		        
		     (if (or (= (nth 3 (nth i group_g))(nth 1 (nth j bays)))(= (nth 3 (nth i group_g))(nth 0 (nth j bays))))
			     (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		       (if (or (= (nth 2 (nth i group_g))(nth 1 (nth j bays)))(= (nth 2 (nth i group_g))(nth 0 (nth j bays))))
			     (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		      (if (or (= (nth 1 (nth i group_g))(nth 2 (nth j bays)))(= (nth 1 (nth i group_g))(nth 3 (nth j bays))))
			       (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     
		      (if (or (= (nth 0 (nth i group_g))(nth 2 (nth j bays)))(= (nth 0 (nth i group_g))(nth 3 (nth j bays))))
			       (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     
		    
		     )
	    )
      (if (and (= (rem i 2) 1)(= (rem j 2) 0))
	           (progn
		         (if (or  (= (nth 0 (nth i group_g))(nth 0 (nth j bays)))(= (nth 0 (nth i group_g))(nth 1 (nth j bays))))
			     (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     (if (or  (= (nth 1 (nth i group_g))(nth 0 (nth j bays)))(= (nth 1 (nth i group_g))(nth 1 (nth j bays))))
			     (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     (if (or (= (nth 2 (nth i group_g))(nth 3 (nth j bays)))(= (nth 2 (nth i group_g))(nth 2 (nth j bays))))
			       (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     
		     (if (or (= (nth 3 (nth i group_g))(nth 3 (nth j bays)))(= (nth 3 (nth i group_g))(nth 2 (nth j bays))))
			       (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		     )
	    )
      (if (and (= (rem  i 2) 1)(= (rem j 2) 1))
	           (progn
		         
		     (if (or (= (nth 3 (nth i group_g))(nth 1 (nth j bays)))(= (nth 3 (nth i group_g))(nth 0 (nth j bays))))
			      (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		      (if (or (= (nth 2 (nth i group_g))(nth 1 (nth j bays)))(= (nth 2 (nth i group_g))(nth 0 (nth j bays))))
			      (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		      (if (or  (= (nth 1 (nth i group_g))(nth 2 (nth j bays)))(= (nth 1 (nth i group_g))(nth 3 (nth j bays))))
			     (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		   
		     
	            (if (or  (= (nth 0 (nth i group_g))(nth 2 (nth j bays)))(= (nth 0 (nth i group_g))(nth 3 (nth j bays))))
			     (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			   )
			   )
		   
	)
	    )
      (setq j (+ j 1))
      )
    (setq i (+ i 1))
    )
(princ bays)
  (princ "\n")(princ group_g)
  elem
  )
(defun replace-n (new n lst / )
  (mapcar '(lambda (a) (if (= (setq n (1- n)) -1) new a)) lst)
  )