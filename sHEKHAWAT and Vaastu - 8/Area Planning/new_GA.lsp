; Final GA PROGRAM
(setq initial_population (numberofchromosomes 300))
(setq population_length 300)

(defun unique ( l )
  (if l
    (cons (car l) (unique (vl-remove (car l) (cdr l))))
  )
)
;(princ "Mating pop ok with length ") (princ (nth 0 initial_population)) (princ "\n") (kk k)

(defun unique_index ( pop / listunique)
  (setq listunique nil)
  (setq u 0)
  ;(setq listunique (append listunique(list 0)))
  (setq checked nil)
 ; (setq checked (append checked (list 1256)))
  (while (< u (length pop))
    (setq glob 0)
    (setq ele_pop (nth u pop))
      (foreach ele checked
        (if (= ele ele_pop)
	  (setq glob 1)
          )
	)
      (if (= glob 0)
	(setq checked (append checked(list (nth u pop))))
	)
    (if (= glob 0)
       (setq listunique (append listunique(list u)))
      )
    (setq u (+ u 1))
     )
  ;(princ listunique)(princ "\n")(princ checked)
  
  listunique
  )

(defun newGA(/ topElements)

  	(setq final_population nil)
	(setq fitness_population nil)
  	(setq new_population nil)
	(setq maximum_iterations 60)
	(setq average_fitness nil)
	(setq crossover_probability 0.95)
	(setq mutation_probability 0.50)
        (setq inversion_probability 0.30)
        (setq chnaceit 8)
        (setq best_it 100)

  

  	(setq final_population initial_population)

    (princ "Initial_pop ok with length") (princ (length final_population)) (princ "\n")
  ;(princ "hello 11")
  
  	; Apply Fitness Function
  	(setq sum 0)
         (setq best_population nil)
         (setq fitness_pop nil)
        ; (fitness_function (nth 0 final_population))
        ; (kk k)
  
  	(foreach chromosome final_population
	  ;(princ "\n")(princ chromosome)
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome

	         
	  
		(setq fitness_population (append fitness_population (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )

 ; (princ "hello 12")
  ;(princ fitness_population)
    ;(princ "hhhhhhhhhh")
    (setq elit nil)
    (setq elit (selectTopElements final_population fitness_population best_it best_population fitness_pop))
    (setq best_population (nth 0 elit))
    (setq fitness_pop (nth 1 elit))
    ;(princ "Initially positive solution are ") (princ count)(princ "\n")
 ; (princ best_population)
  	;Calculate Average Fitness
  	(setq average_fitness (/ sum (length fitness_population)))
  	(setq initial_fitness average_fitness)
        
    ;(princ "Average fitness ok\n")
  
  	(setq iterator 0)
  	(setq chance 0)

  
    (while
	    (and
	      (< iterator maximum_iterations)
	      (< chance 25)
	    ) 
	 ;Selection of mating population
	  ;(princ "hello 1")
  	(setq selection_index_list nil
	      mating_population nil)

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list (stochasticUniversalSampling fitness_population 150))  ;find segment which corresponds to the pointer and the corresponding index to the list

	 
       ; (princ "selection ")(princ selection_index_list)rouletteWheelstochasticUniversalSampling
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list
	  
	       (setq add_in_mating (list (nth value final_population)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population (append mating_population add_in_mating))
	)
     
    ;(princ "helooo1")
    
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)
         ;(princ "hello")
	 (while (< i population_length)

	        (setq index1 (fix (* (length mating_population) (randnum))))
		    (setq index2 (fix (* (length mating_population) (randnum))))
	   
		 	;(princ "hello2")	
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population) (randnum))))
		      (setq index2 (fix (* (length mating_population) (randnum))))
			)
 
			(setq parent1 (nth index1 mating_population))
		    (setq parent2 (nth index2 mating_population))

					 
            (setq rndn (randnum))
					
	        (if (< rndn crossover_probability)
			  (progn
				
			    ;(princ "Parent 1")(princ parent1)(princ "\n")
			    ;(princ "parent 2")(princ parent2)(princ "\n")
			  
		        (setq temp_list (crossover (list parent1 parent2)))   ;calling the crossover function
			  )
		    )
           
	         

	       (if (= temp_list nil)
			 (progn

			    (setq generated_offsprings (append generated_offsprings (list parent1)))
			    (setq generated_offsprings (append generated_offsprings (list parent2)))
			 )
			 
			 (progn
		       (if  (or (member (list nil) (nth 0 temp_list)) (member nil (nth 0 temp_list)))
		       (progn
		       )
		       (progn
		
			       (setq generated_offsprings
			           (append generated_offsprings
				         (list (nth 0 temp_list))
			           )
			       )
		       )
		       )
	
		      (if (or (member (list nil) (nth 1 temp_list)) (member nil (nth 1 temp_list)))
		      (progn
		      )
		      (progn
			
			  (setq generated_offsprings
			       (append generated_offsprings
				       (list (nth 1 temp_list))
			       )
			   )

			   )
			  )
			 )
		    )
		   
		  (setq i (+ i 1))
		)
     
    ;	(princ "hello2")
  ; (princ "after crossover\n")
	   (setq offsprings nil)
	  ; Mutation Probability on GENERATED OFFSPRINGS
      (setq off generated_offsprings)
  ;|	(foreach chromosome off
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq offsprings(append offsprings(list  (mutation chromosome))))
		  )
	        (progn
		  (setq offsprings(append offsprings (list chromosome)))
		  )
	    )
	;  (if(< rndn mutation_probability)
	(setq generated_offsprings offsprings)
         ;)
	)
     (setq off generated_offsprings)|;
      ;(princ "hello3")
       
       (setq offsprings nil)
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome off
	  (setq rndn (randnum))
	  (if(< rndn inversion_probability)
		(progn
		    (setq offsprings(append offsprings(list  (inversion chromosome))))
		  )
	        (progn
		  (setq offsprings(append offsprings (list chromosome)))
		  )
	    )
	;  (if(< rndn mutation_probability)
	(setq generated_offsprings offsprings)
         ;)
	)
 
	;(princ "hello 4")
  	; Make new population

	

	(setq final_population generated_offsprings)
	 
	
	(setq sum 0)
  	(setq fitness_population nil)
	  ;(princ "hello 10")
  	(foreach chromosome final_population
	        ; (princ "\n")(princ fitness_population)
	  	(setq value (fitness_function chromosome))
		(setq fitness_population (append fitness_population (list value)))
		(setq sum (+ sum value))
	  )
        ;(princ "hello 5")
  	;Calculate Average Fitness
        (setq elit (selectTopElements final_population fitness_population best_it best_population fitness_pop ))
      (setq best_population (nth 0 elit))
    (setq fitness_pop (nth 1 elit))
       ; (princ (length final_population))(princ "\n")
      ;(princ "hello 6")
        (setq i 0)
        (setq jth 0)
       (while (< i 30)
	  (setq jth (fix (* (randnum) (length final_population))))
          (setq final_population (replace-n (nth i best_population) jth final_population))

         (setq i (+ i 1))
	)
       ; (princ final_population)
	(setq i 0)
  	(setq new_average_fitness (/ sum (length fitness_population)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness) (princ "\n")
       ; (princ "hello 7")
	
	(setq previous_average_fitness average_fitness)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness new_average_fitness)

          ;(princ "helloo")
	  (if(= previous_average_fitness average_fitness)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    
    	 
	) ; End of iterator while
   (setq sum 0)
  (princ (length best_population))
  (setq fitness_population nil)
   	(foreach chromosome best_population
	  	(setq value (fitness_function chromosome))
		(setq fitness_population (append fitness_population (list value)))
		(setq sum (+ sum value))
	  )

    (setq unique_fitness (unique fitness_population))
  (setq unique_fitness1 (unique_index fitness_population))
 ; (princ  (length unique_fitness1))(princ "\n")
  ;(princ fitness_population)
     (setq fit_store fitness_population)
	(princ "Unique Fitness Population ") (princ (length unique_fitness)) (princ "\n") 
	  

    (setq topElements nil)
  	
  (setq index2 0)
         (setq i 0)
  (setq indexlist nil)
  (setq ele_unique 0)
       	(while (< i (length unique_fitness1))
     
              (setq ele_unique (nth i unique_fitness1))
	     (setq indexlist (append indexlist (list (nth ele_unique fitness_population))))
             
             ;(setq fitness_population (replace-n 0 index1 fitness_population))
	     ;(setq topElements (append topElements(list (nth index1 best_population))))
          
	(setq i (+ i 1))
        )
     (setq decision 0)
     (if (< (length unique_fitness1) 10)
       (setq decision (length unique_fitness1))
       (setq decision 10)
       )
     (setq index1 0)
     (setq i 0)
     (while (< i decision)
     
             ;(setq index1 (nth i unique_fitness1))
	     (setq index1 (vl-position (apply 'max indexlist) indexlist))
             
             (setq indexlist (replace-n 0 index1 indexlist))
             (setq index2 (nth index1 unique_fitness1))
	     (setq topElements (append topElements(list (nth index2 best_population))))
          
	(setq i (+ i 1))
        )
     
  

       ; (setq average_fitness (/ sum (length best_population)))
    ;(princ iterator)(princ "\n")
  	(princ initial_fitness)(princ "\n")
  	(princ average_fitness)(princ "\n")
        (princ "max fitness_value chromosome ")
      (princ (apply 'max fit_store))
    ;(princ fitness_population)(princ)

    
    

    ;returns the top elements

   topElements
  
  ) ;end of newGA
