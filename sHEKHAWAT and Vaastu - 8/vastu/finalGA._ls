; Final GA PROGRAM
(setq initial_population (numberofchromosomes 100))

(defun unique ( l )
  (if l
    (cons (car l)
      (unique (vl-remove (car l) (cdr l)))
    )
  )
)

(defun initiateGA(/ final_population iterator chance fitness_population maximum_iterations average_fitness crossover_probability mutation_probability chromosome value selection_index_list mating_population crossover_list rndn parent1 parent2 temp_list generated_offsprings crossover_list mutation_list generated_population)

  	(setq final_population nil)
	(setq fitness_population nil)
  	(setq new_population nil)
	(setq maximum_iterations 50)
	(setq average_fitness nil)
	(setq crossover_probability 0.95)
	(setq mutation_probability 0.06)

  	;Initial Population Generation
  	;(setq final_population (numberofchromosomes 100))            ;Generate  100 chromosomes

  	(setq final_population initial_population)

   
  
  	;(princ (type final_population))
  	;(setq kschromosome (grouping (create_pair)))
	;(setq final_population (append final_population (list kschromosome)))
  
  	; Apply Fitness Function
  	(setq sum 0)
  	(foreach chromosome final_population
	  	(setq value (fitness_function chromosome))
		(setq fitness_population (append fitness_population (list value)))
	  	(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq average_fitness (/ sum (length fitness_population)))
  	(setq initial_fitness average_fitness)

  	(setq iterator 0)
  	(setq chance 0)
  
  	;(princ "Initial Population")(princ initial_population)(princ "\n")

  (while
	  (and
	    (< iterator maximum_iterations)
	    (< chance 25)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list nil
	      mating_population nil)
	
  	(setq selection_index_list (stochasticUniversalSampling fitness_population 70))

	;(princ "Selection List=  ") (princ selection_index_list)(princ "\n")

	
	
	(foreach value selection_index_list
	    (setq add_in_mating (list (nth value final_population)))

		   (setq mating_population (append mating_population add_in_mating))
	)

	
    ;(princ "Mating Population")(princ mating_population)(princ "\n")

	;Crossover Probability Check
  	(setq crossover_list nil)
	(foreach chromosome mating_population
	  (setq rndn (randnum))
	  (if (< rndn crossover_probability)
	    (progn
	      (setq crossover_list (append crossover_list (list chromosome)))
	      (setq mating_population
		     (vl-remove	chromosome
				mating_population
		     )
	      )
	    )
	  )
	)

	;(princ "Crossover List   ")(princ crossover_list)(princ "\n")

  	;Mutation Probability Check
  	(setq mutation_list nil)
  	(foreach chromosome mating_population
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		  (setq mutation_list (append mutation_list (list chromosome)))
		  (setq mating_population (vl-remove chromosome mating_population))
		  )
	    )
	  )
 

  	;;Choose Parents and Perform Crossover Operation
  	
  		(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)
		(while (< i (length crossover_list))
		  (setq j (+ i 1))
		  (while (< j (length crossover_list))
		    (setq parent1 (nth i crossover_list))
		    (setq parent2 (nth j crossover_list))
		    (setq temp_list (crossover (list parent1 parent2)))
		   
		    ;(princ temp_list)(princ "\n")
		    (if(or (member (list nil) (nth 0 temp_list)) (member nil (nth 1 temp_list)))
		      (progn
		      )
		      (progn
			;(princ (nth 0 temp_list))(princ "\n")
			(setq generated_offsprings
			       (append generated_offsprings
				       (list (nth 0 temp_list))
			       )
			)
		      )
		    )
		    (if(or (member (list nil) (nth 1 temp_list)) (member nil (nth 1 temp_list)))
		      (progn
		      )
		      (progn
			;(princ (nth 1 temp_list))(princ "\n")
			(setq generated_offsprings
			       (append generated_offsprings
				       (list (nth 1 temp_list))
			       )
			)
		      )
		    )
		    (setq j (+ j 1))
		  )
		  (setq i (+ i 1))
		)
    	
	; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		  (setq mutation_list (append mutation_list (list chromosome)))
		  (setq generated_offsprings (vl-remove chromosome generated_offsprings))
		  )
	    )
	)
	
	;(princ mutation_list)(princ "\n")
  	;Mutation of chromosomes in mutation list
  	(setq generated_population nil
	      temp nil)
  	(foreach chromosome mutation_list
	  ;(princ chromosome)(princ "\n")
	  (setq temp (mutation chromosome))
	  ;(princ temp)
	  (setq generated_population (append generated_population  (list temp)))
	 )

    	;(princ "bahar")
    
  	; Appending leftovers of crossovers and mating population
  	(foreach chromosome generated_offsprings
	  (setq generated_population (append generated_population (list chromosome)))
	  )
  
  	(foreach chromosome mating_population
	  (setq generated_population (append generated_population (list chromosome)))
	  )

    	;(princ "LEngth")(princ (length generated_population))(princ "\n")
  	;fitness check
   	(foreach chromosome generated_population
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_population (vl-remove chromosome generated_population))
		  )
	  )
	
  	; Make new population
	;(setq final_population (append final_population generated_population))

	
    (setq final_population generated_population)
	
    	;Make sure no duplicates exist in the new polulation
	(princ "before")(princ (length final_population))(princ "\n")
    	
    ;(setq final_population (unique final_population))

	;(princ "After applying unique")(princ (length final_population))(princ "\n")

    ;(princ "after")(princ final_population)(princ)
	
  	; Apply Fitness Function
  	
	(setq fitness_population nil)
	(setq temp_pop nil)
	
  	(foreach chromosome final_population

	  (setq value (fitness_function chromosome))
	  ;(princ "Value = ")  (princ value)
	  (setq fitness_population (append fitness_population (list value)))
	  (setq temp_pop (append temp_pop (list chromosome)))
	  
	  ;(princ "Heya ") (princ (member value fitness_population))
	  ; (if (/= (member value fitness_population) nil)
       ;  (progn
            
		; )
		 ;(progn
		    ;(princ "Else")
		  ;  (setq fitness_population (append fitness_population (list value)))
		   ; (setq temp_pop (append temp_pop (list chromosome)))
		 ;)
	   ;)
	  ;)
	  
	)
	(setq final_population temp_pop)

  	
  	; Select top 100
  	(setq index_list nil
	      new_population nil
	)

	;(princ "\n")
	(princ "Fitness_population before selecting")(princ (length fitness_population)) (princ "\n")

	;;;;;;;;;;;;;Changed HEre
	
	;(setq fitness_population (unique fitness_population))

	;(princ "Fitness_population After unique")(princ (length fitness_population)) (princ "\n")
	
	(setq index_list (selectTopElements fitness_population 100))

	(princ "index list   ") (princ (length index_list)) (princ "\n")
    
	(foreach index index_list
	  (setq	new_population
		 (append new_population
			 (list (nth index final_population))
		 )
	  )
	)
	

	;(princ new_population)(princ "\n")
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population nil)
  	(foreach chromosome new_population
	  	(setq value (fitness_function chromosome))
		(setq fitness_population (append fitness_population (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness (/ sum (length fitness_population)))
	  
	(setq previous_average_fitness average_fitness)
	  
	(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness new_average_fitness)

	;(princ "Average fitness  ") (princ average_fitness)(princ "\n")
	  (if(= previous_average_fitness average_fitness)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 ;(princ "Final Population")(princ final_population)(princ "\n")

	  ;(princ "------------------------------------------------------------------------------\n\n")
	)

  	;(setq uniqueElements (unique final_population))

   ; (princ "Top Elements Unique Population")(princ (length uniqueElements))(princ "\n")

    (setq topElements nil)
  	(setq index 0)
  
	(while (< index 10)
      ;(princ "In while")
	   (setq topElements
		  (append topElements
	 		(list (nth index final_population))
		   )
		)
	   ;(princ (nth index uniqueElements))
	   ;(princ "\n")
	   (setq index (1+ index))
	)
	;

    ;(princ iterator)(princ "\n")
  	(princ initial_fitness)(princ "\n")
  	(princ average_fitness)(princ "\n")

    ;(princ fitness_population)(princ)
  
    ;(princ (length final_population))(princ "\n")
  	;(princ topElements)(princ)

  	;(princ "  {\n     \"" f)(princ sel_var f)(princ "\" : \"" f)(princ average_fitness f)(princ "\"\n  },\n" f)

            
  	;(princ maximum_iterations)(princ "\n")
	;(princ new_population)(princ "\n")
  	;(princ (nth (vl-)))

    ;returns the top elements

   topElements
  )
