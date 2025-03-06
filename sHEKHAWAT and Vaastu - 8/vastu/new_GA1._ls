(defun newGA1()

  	(setq final_population nil)
	(setq fitness_population0 nil)
  (setq fitness_population1 nil)
(setq fitness_population2 nil)
(setq fitness_population3 nil)
(setq fitness_population4 nil)
(setq fitness_population5 nil)
(setq fitness_population6 nil)
(setq fitness_population7 nil)
(setq fitness_population8 nil)
(setq fitness_population9 nil)

  	(setq new_population nil)
	(setq maximum_iterations 10)
	(setq average_fitness nil)
	(setq crossover_probability 0.95)
	(setq mutation_probability 0.05)
    

  

  ;	(setq final_population initial_population)
 

    (princ "Initial_pop ok with length") (princ (length final_population)) (princ "\n")
  (foreach final finalpopulation
    (cond
	    ((= fianl 0)
	     (setq output0 (append output0 (list final finalpopulation)))
	    )
	    ((= fianl 1)
	     (setq output1 (append output1 (list final finalpopulation)))
	    )
	    ((= fianl 2)
	     (setq output2 (append output2(list final finalpopulation)))
	    )
	    ((= fianl 3)
	     (setq output3 (append output3 (list final finalpopulation)))
	    )
	    ((= fianl 4)
	     (setq output4 (append output4 (list final finalpopulation)))
	    )
	     ((= fianl 5)
	     (setq output5(append output5 (list final finalpopulation)))
	      )
	     ((= fianl 6)
	     (setq output6(append output6 (list final finalpopulation)))
	      )
	     ((= fianl 7)
	     (setq output7 (append output7 (list final finalpopulation)))
	      )
	     ((= fianl 8)
	     (setq output8 (append output8 (list final finalpopulation)))
	      )
	    ((= fianl 9)
	     (setq output9 (append output9 (list final finalpopulation)))
	      )
	  )
    )
             (princ output0)(princ "\n")
	     (princ output1)(princ "\n")
	     (princ output2)(princ "\n")
             (princ output3)(princ "\n")
	     (princ output4)(princ "\n")
	     (princ output5)(princ "\n")
	     (princ output6)(princ "\n")
	     (princ output7)(princ "\n")
	     (princ output8)(princ "\n")
	      (princ output9)
  
  	; Apply Fitness Function
  	(setq sum 0)

    ;(setq count 0)
  	(foreach chromosome output0
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome
	    ;(princ "value of fitness= ")(princ value)(princ "\n")

	    ;(if (> value 0)
        ;   (setq count (+ count 1))
		;)
	  
		(setq fitness_population0 (append fitness_population0 (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )
  	(foreach chromosome output1
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome
	    ;(princ "value of fitness= ")(princ value)(princ "\n")

	    ;(if (> value 0)
        ;   (setq count (+ count 1))
		;)
	  
		(setq fitness_population1 (append fitness_population1 (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )
  	(foreach chromosome output2
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome
	    ;(princ "value of fitness= ")(princ value)(princ "\n")

	    ;(if (> value 0)
        ;   (setq count (+ count 1))
		;)
	  
		(setq fitness_population2 (append fitness_population2 (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )
  	(foreach chromosome output3
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome
	    ;(princ "value of fitness= ")(princ value)(princ "\n")

	    ;(if (> value 0)
        ;   (setq count (+ count 1))
		;)
	  
		(setq fitness_population3 (append fitness_population3 (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )
  	(foreach chromosome output4
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome
	    ;(princ "value of fitness= ")(princ value)(princ "\n")

	    ;(if (> value 0)
        ;   (setq count (+ count 1))
		;)
	  
		(setq fitness_population4 (append fitness_population4 (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )
  	(foreach chromosome output5
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome
	    ;(princ "value of fitness= ")(princ value)(princ "\n")

	    ;(if (> value 0)
        ;   (setq count (+ count 1))
		;)
	  
		(setq fitness_population5 (append fitness_population5 (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )
  	(foreach chromosome output6
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome
	    ;(princ "value of fitness= ")(princ value)(princ "\n")

	    ;(if (> value 0)
        ;   (setq count (+ count 1))
		;)
	  
		(setq fitness_population6 (append fitness_population6 (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )
  	(foreach chromosome output7
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome
	    ;(princ "value of fitness= ")(princ value)(princ "\n")

	    ;(if (> value 0)
        ;   (setq count (+ count 1))
		;)
	  
		(setq fitness_population7 (append fitness_population7 (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )
  	(foreach chromosome output8
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome
	    ;(princ "value of fitness= ")(princ value)(princ "\n")

	    ;(if (> value 0)
        ;   (setq count (+ count 1))
		;)
	  
		(setq fitness_population8 (append fitness_population8 (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )
  	(foreach chromosome output9
	  	(setq value (fitness_function chromosome))  ;calculating fitness value of each chromosome
	    ;(princ "value of fitness= ")(princ value)(princ "\n")

	    ;(if (> value 0)
        ;   (setq count (+ count 1))
		;)
	  
		(setq fitness_population9 (append fitness_population9 (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	(setq sum (+ sum value))
	  )

    ;(princ "Initially positive solution are ") (princ count)(princ "\n")
  
  	;Calculate Average Fitness
  	(setq average_fitness0 (/ sum (length fitness_population0)))
        (setq average_fitness1 (/ sum (length fitness_population1)))
        (setq average_fitness2 (/ sum (length fitness_population2)))
        (setq average_fitness3 (/ sum (length fitness_population3)))
        (setq average_fitness4 (/ sum (length fitness_population4)))
        (setq average_fitness5 (/ sum (length fitness_population5)))
        (setq average_fitness6 (/ sum (length fitness_population6)))
        (setq average_fitness7 (/ sum (length fitness_population7)))
        (setq average_fitness8 (/ sum (length fitness_population8)))
        (setq average_fitness9 (/ sum (length fitness_population9)))
  	
  (setq initial_fitness0 average_fitness0)
  (setq initial_fitness1 average_fitness1)
  (setq initial_fitness2 average_fitness2)
  (setq initial_fitness3 average_fitness3)
  (setq initial_fitness4 average_fitness4)
  (setq initial_fitness5 average_fitness5)
  (setq initial_fitness6 average_fitness6)
  (setq initial_fitness7 average_fitness7)
  (setq initial_fitness8 average_fitness8)
  (setq initial_fitness9 average_fitness9)

    ;(princ "Average fitness ok\n")
  
  	(setq iterator 0)
  	(setq chance 0)
  
  
    (while
	    (and
	      (< iterator maximum_iterations)
	      (< chance 25)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list0 nil
	      mating_population0 nil
	      
              )

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list0 (stochasticUniversalSampling fitness_population0 5))  ;find segment which corresponds to the pointer and the corresponding index to the list

      ; (princ "\n")(princ selection_index_list0)
       ; (princ "selection ")(princ selection_index_list)
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list0
	  
	       (setq add_in_mating0 (list (nth value output0)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population0 (append mating_population0 add_in_mating0))
	)
    
    ;(princ "Mating pop ok with length ") (princ mating_population) (princ "\n")
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)

	 (while (< i 30)

	        (setq index1 (fix (* (length mating_population0) (randnum))))
		    (setq index2 (fix (* (length mating_population0) (randnum))))
	   
				  
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population0) (randnum))))
		      (setq index2 (fix (* (length mating_population0) (randnum))))
			)

			(setq parent1 (nth index1 mating_population0))
		    (setq parent2 (nth index2 mating_population0))

					 
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
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq chromosome (mutation chromosome))
		  )
	    )
	)
	

    
  

  	;|fitness check
   	(foreach chromosome generated_offsprings
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_offsprings (vl-remove chromosome generated_offsprings))
		)
	) |;
	
  	; Make new population

	

	(setq output0 generated_offsprings)
	  
	;(princ "Length of generated offspring is ")(princ (length final_population))(princ "\n")
    	
    
	
  	; Apply Fitness Function
  	
	;(setq fitness_population nil)

  	;(foreach chromosome final_population

	;  (setq value (fitness_function chromosome))
	 ; (setq fitness_population (append fitness_population (list value)))
	  
	  
	;)
	;(setq final_population temp_pop)

  	
  
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population0 nil)
	  
  	(foreach chromosome output0
	  	(setq value (fitness_function chromosome))
		(setq fitness_population0 (append fitness_population0 (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness0 (/ sum (length fitness_population0)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness0) (princ "\n")

	
	(setq previous_average_fitness0 average_fitness0)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness0 new_average_fitness0)


	  (if(= previous_average_fitness0 average_fitness0)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 
	) ; End of iterator while

  ;**************************************************************************************************************************************************************************
	(setq iterator 0)
  	(setq chance 0)
  
  (while
	    (and
	      (< iterator maximum_iterations)
	      (< chance 25)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list1 nil
	      mating_population1 nil
	      
              )

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list1 (stochasticUniversalSampling fitness_population1 5))  ;find segment which corresponds to the pointer and the corresponding index to the list

      ; (princ "\n")(princ selection_index_list0)
       ; (princ "selection ")(princ selection_index_list)
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list1
	  
	       (setq add_in_mating1 (list (nth value output1)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population1 (append mating_population1 add_in_mating1))
	)
    
    ;(princ "Mating pop ok with length ") (princ mating_population) (princ "\n")
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)

	 (while (< i 30)

	        (setq index1 (fix (* (length mating_population1) (randnum))))
		    (setq index2 (fix (* (length mating_population1) (randnum))))
	   
				  
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population1) (randnum))))
		      (setq index2 (fix (* (length mating_population1) (randnum))))
			)

			(setq parent1 (nth index1 mating_population1))
		    (setq parent2 (nth index2 mating_population1))

					 
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
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq chromosome (mutation chromosome))
		  )
	    )
	)
	

    
  

  	;|fitness check
   	(foreach chromosome generated_offsprings
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_offsprings (vl-remove chromosome generated_offsprings))
		)
	) |;
	
  	; Make new population

	

	(setq output1 generated_offsprings)
	  
	;(princ "Length of generated offspring is ")(princ (length final_population))(princ "\n")
    	
    
	
  	; Apply Fitness Function
  	
	;(setq fitness_population nil)

  	;(foreach chromosome final_population

	;  (setq value (fitness_function chromosome))
	 ; (setq fitness_population (append fitness_population (list value)))
	  
	  
	;)
	;(setq final_population temp_pop)

  	
  
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population1 nil)
	  
  	(foreach chromosome output1
	  	(setq value (fitness_function chromosome))
		(setq fitness_population1 (append fitness_population1 (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness1 (/ sum (length fitness_population1)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness1) (princ "\n")

	
	(setq previous_average_fitness1 average_fitness1)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness1 new_average_fitness1)


	  (if(= previous_average_fitness1 average_fitness1)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 
	) ;end of iterator while

  ;******************************************************************************************************************************************************************
	(setq iterator 0)
  	(setq chance 0)
  
      (while
	    (and
	      (< iterator maximum_iterations)
	      (< chance 25)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list2 nil
	      mating_population2 nil
	      
              )

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list2 (stochasticUniversalSampling fitness_population2 5))  ;find segment which corresponds to the pointer and the corresponding index to the list

      ; (princ "\n")(princ selection_index_list0)
       ; (princ "selection ")(princ selection_index_list)
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list2
	  
	       (setq add_in_mating2 (list (nth value output2)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population2 (append mating_population2 add_in_mating2))
	)
    
    ;(princ "Mating pop ok with length ") (princ mating_population) (princ "\n")
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)

	 (while (< i 30)

	        (setq index1 (fix (* (length mating_population2) (randnum))))
		    (setq index2 (fix (* (length mating_population2) (randnum))))
	   
				  
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population2) (randnum))))
		      (setq index2 (fix (* (length mating_population2) (randnum))))
			)

			(setq parent1 (nth index1 mating_population2))
		    (setq parent2 (nth index2 mating_population2))

					 
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
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq chromosome (mutation chromosome))
		  )
	    )
	)
	

    
  

  	;|fitness check
   	(foreach chromosome generated_offsprings
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_offsprings (vl-remove chromosome generated_offsprings))
		)
	) |;
	
  	; Make new population

	

	(setq ouput2 generated_offsprings)
	  
	;(princ "Length of generated offspring is ")(princ (length final_population))(princ "\n")
    	
    
	
  	; Apply Fitness Function
  	
	;(setq fitness_population nil)

  	;(foreach chromosome final_population

	;  (setq value (fitness_function chromosome))
	 ; (setq fitness_population (append fitness_population (list value)))
	  
	  
	;)
	;(setq final_population temp_pop)

  	
  
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population2 nil)
	  
  	(foreach chromosome output2
	  	(setq value (fitness_function chromosome))
		(setq fitness_population2 (append fitness_population2 (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness2 (/ sum (length fitness_population2)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness2) (princ "\n")

	
	(setq previous_average_fitness2 average_fitness2)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness2 new_average_fitness2)


	  (if(= previous_average_fitness2 average_fitness2)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 
	)
  ;*********************************************************************************************************************************************************************
	(setq iterator 0)
  	(setq chance 0)
  
      (while
	    (and
	      (< iterator maximum_iterations)
	      (< chance 25)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list3 nil
	      mating_population3 nil
	      
              )

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list3 (stochasticUniversalSampling fitness_population3 5))  ;find segment which corresponds to the pointer and the corresponding index to the list

      ; (princ "\n")(princ selection_index_list0)
       ; (princ "selection ")(princ selection_index_list)
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list3
	  
	       (setq add_in_mating3 (list (nth value output3)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population3 (append mating_population3 add_in_mating3))
	)
    
    ;(princ "Mating pop ok with length ") (princ mating_population) (princ "\n")
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)

	 (while (< i 30)

	        (setq index1 (fix (* (length mating_population3) (randnum))))
		    (setq index2 (fix (* (length mating_population3) (randnum))))
	   
				  
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population3) (randnum))))
		      (setq index2 (fix (* (length mating_population3) (randnum))))
			)

			(setq parent1 (nth index1 mating_population3))
		    (setq parent2 (nth index2 mating_population3))

					 
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
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq chromosome (mutation chromosome))
		  )
	    )
	)
	

    
  

  	;|fitness check
   	(foreach chromosome generated_offsprings
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_offsprings (vl-remove chromosome generated_offsprings))
		)
	) |;
	
  	; Make new population

	

	(setq output3 generated_offsprings)
	  
	;(princ "Length of generated offspring is ")(princ (length final_population))(princ "\n")
    	
    
	
  	; Apply Fitness Function
  	
	;(setq fitness_population nil)

  	;(foreach chromosome final_population

	;  (setq value (fitness_function chromosome))
	 ; (setq fitness_population (append fitness_population (list value)))
	  
	  
	;)
	;(setq final_population temp_pop)

  	
  
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population3 nil)
	  
  	(foreach chromosome output3
	  	(setq value (fitness_function chromosome))
		(setq fitness_population3 (append fitness_population3 (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness3 (/ sum (length fitness_population3)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness3) (princ "\n")

	
	(setq previous_average_fitness3 average_fitness3)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness3 new_average_fitness3)


	  (if(= previous_average_fitness3 average_fitness3)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 
	)  ; end of iterator while
;*********************************************************************************************************************************************************************
	(setq iterator 0)
  	(setq chance 0)
  
      (while
	    (and
	      (< iterator maximum_iterations)
	      (< chance 25)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list4 nil
	      mating_population4 nil
	      
              )

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list4 (stochasticUniversalSampling fitness_population4 5))  ;find segment which corresponds to the pointer and the corresponding index to the list

      ; (princ "\n")(princ selection_index_list0)
       ; (princ "selection ")(princ selection_index_list)
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list4
	  
	       (setq add_in_mating4 (list (nth value output4)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population4 (append mating_population3 add_in_mating4))
	)
    
    ;(princ "Mating pop ok with length ") (princ mating_population) (princ "\n")
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)

	 (while (< i 30)

	        (setq index1 (fix (* (length mating_population4) (randnum))))
		    (setq index2 (fix (* (length mating_population4) (randnum))))
	   
				  
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population4) (randnum))))
		      (setq index2 (fix (* (length mating_population4) (randnum))))
			)

			(setq parent1 (nth index1 mating_population4))
		    (setq parent2 (nth index2 mating_population4))

					 
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
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq chromosome (mutation chromosome))
		  )
	    )
	)
	

    
  

  	;|fitness check
   	(foreach chromosome generated_offsprings
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_offsprings (vl-remove chromosome generated_offsprings))
		)
	) |;
	
  	; Make new population

	

	(setq output4 generated_offsprings)
	  
	;(princ "Length of generated offspring is ")(princ (length final_population))(princ "\n")
    	
    
	
  	; Apply Fitness Function
  	
	;(setq fitness_population nil)

  	;(foreach chromosome final_population

	;  (setq value (fitness_function chromosome))
	 ; (setq fitness_population (append fitness_population (list value)))
	  
	  
	;)
	;(setq final_population temp_pop)

  	
  
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population4 nil)
	  
  	(foreach chromosome output4
	  	(setq value (fitness_function chromosome))
		(setq fitness_population4 (append fitness_population4 (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness4 (/ sum (length fitness_population4)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness4) (princ "\n")

	
	(setq previous_average_fitness4 average_fitness4)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness4 new_average_fitness4)


	  (if(= previous_average_fitness4 average_fitness4)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 
	)  ; end of iterator while
  ;********************************************************************************************************************************
  ;*********************************************************************************************************************************************************************
	(setq iterator 0)
  	(setq chance 0)
  
      (while
	    (and
	      (< iterator maximum_iterations)
	      (< chance 3)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list5 nil
	      mating_population5 nil
	      
              )

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list5 (stochasticUniversalSampling fitness_population5 5))  ;find segment which corresponds to the pointer and the corresponding index to the list

      ; (princ "\n")(princ selection_index_list0)
       ; (princ "selection ")(princ selection_index_list)
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list5
	  
	       (setq add_in_mating5 (list (nth value output5)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population5 (append mating_population5 add_in_mating5))
	)
    
    ;(princ "Mating pop ok with length ") (princ mating_population) (princ "\n")
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)

	 (while (< i 30)

	        (setq index1 (fix (* (length mating_population5) (randnum))))
		    (setq index2 (fix (* (length mating_population5) (randnum))))
	   
				  
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population5) (randnum))))
		      (setq index2 (fix (* (length mating_population5) (randnum))))
			)

			(setq parent1 (nth index1 mating_population5))
		    (setq parent2 (nth index2 mating_population5))

					 
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
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq chromosome (mutation chromosome))
		  )
	    )
	)
	

    
  

  	;|fitness check
   	(foreach chromosome generated_offsprings
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_offsprings (vl-remove chromosome generated_offsprings))
		)
	) |;
	
  	; Make new population

	

	(setq output5 generated_offsprings)
	  
	;(princ "Length of generated offspring is ")(princ (length final_population))(princ "\n")
    	
    
	
  	; Apply Fitness Function
  	
	;(setq fitness_population nil)

  	;(foreach chromosome final_population

	;  (setq value (fitness_function chromosome))
	 ; (setq fitness_population (append fitness_population (list value)))
	  
	  
	;)
	;(setq final_population temp_pop)

  	
  
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population5 nil)
	  
  	(foreach chromosome output5
	  	(setq value (fitness_function chromosome))
		(setq fitness_population5 (append fitness_population5 (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness5 (/ sum (length fitness_population5)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness5) (princ "\n")

	
	(setq previous_average_fitness5 average_fitness5)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness5 new_average_fitness5)


	  (if(= previous_average_fitness5 average_fitness5)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 
	)  ; end of iterator while
  ;********************************************************************************************************************************
  ;*********************************************************************************************************************************************************************
	(setq iterator 0)
  	(setq chance 0)
  
      (while
	    (and
	      (< iterator maximum_iterations)
	      (< chance 3)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list6 nil
	      mating_population6 nil
	      
              )

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list6 (stochasticUniversalSampling fitness_population6 5))  ;find segment which corresponds to the pointer and the corresponding index to the list

      ; (princ "\n")(princ selection_index_list0)
       ; (princ "selection ")(princ selection_index_list)
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list6
	  
	       (setq add_in_mating6 (list (nth value output6)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population6 (append mating_population6 add_in_mating6))
	)
    
    ;(princ "Mating pop ok with length ") (princ mating_population) (princ "\n")
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)

	 (while (< i 30)

	        (setq index1 (fix (* (length mating_population6) (randnum))))
		    (setq index2 (fix (* (length mating_population6) (randnum))))
	   
				  
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population6) (randnum))))
		      (setq index2 (fix (* (length mating_population6) (randnum))))
			)

			(setq parent1 (nth index1 mating_population6))
		    (setq parent2 (nth index2 mating_population6))

					 
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
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq chromosome (mutation chromosome))
		  )
	    )
	)
	

    
  

  	;|fitness check
   	(foreach chromosome generated_offsprings
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_offsprings (vl-remove chromosome generated_offsprings))
		)
	) |;
	
  	; Make new population

	

	(setq output6 generated_offsprings)
	  
	;(princ "Length of generated offspring is ")(princ (length final_population))(princ "\n")
    	
    
	
  	; Apply Fitness Function
  	
	;(setq fitness_population nil)

  	;(foreach chromosome final_population

	;  (setq value (fitness_function chromosome))
	 ; (setq fitness_population (append fitness_population (list value)))
	  
	  
	;)
	;(setq final_population temp_pop)

  	
  
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population6 nil)
	  
  	(foreach chromosome output6
	  	(setq value (fitness_function chromosome))
		(setq fitness_population6 (append fitness_population6 (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness6 (/ sum (length fitness_population6)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness6) (princ "\n")

	
	(setq previous_average_fitness6 average_fitness6)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness6 new_average_fitness6)


	  (if(= previous_average_fitness6 average_fitness6)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 
	)  ; end of iterator while
  ;********************************************************************************************************************************

;*********************************************************************************************************************************************************************
	(setq iterator 0)
  	(setq chance 0)
  
      (while
	    (and
	      (< iterator maximum_iterations)
	      (< chance 3)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list7 nil
	      mating_population7 nil
	      
              )

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list7 (stochasticUniversalSampling fitness_population7 5))  ;find segment which corresponds to the pointer and the corresponding index to the list

      ; (princ "\n")(princ selection_index_list0)
       ; (princ "selection ")(princ selection_index_list)
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list7
	  
	       (setq add_in_mating7 (list (nth value output7)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population7 (append mating_population7 add_in_mating7))
	)
    
    ;(princ "Mating pop ok with length ") (princ mating_population) (princ "\n")
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)

	 (while (< i 30)

	        (setq index1 (fix (* (length mating_population7) (randnum))))
		    (setq index2 (fix (* (length mating_population7) (randnum))))
	   
				  
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population7) (randnum))))
		      (setq index2 (fix (* (length mating_population7) (randnum))))
			)

			(setq parent1 (nth index1 mating_population7))
		    (setq parent2 (nth index2 mating_population7))

					 
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
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq chromosome (mutation chromosome))
		  )
	    )
	)
	

    
  

  	;|fitness check
   	(foreach chromosome generated_offsprings
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_offsprings (vl-remove chromosome generated_offsprings))
		)
	) |;
	
  	; Make new population

	

	(setq output7 generated_offsprings)
	  
	;(princ "Length of generated offspring is ")(princ (length final_population))(princ "\n")
    	
    
	
  	; Apply Fitness Function
  	
	;(setq fitness_population nil)

  	;(foreach chromosome final_population

	;  (setq value (fitness_function chromosome))
	 ; (setq fitness_population (append fitness_population (list value)))
	  
	  
	;)
	;(setq final_population temp_pop)

  	
  
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population7 nil)
	  
  	(foreach chromosome output7
	  	(setq value (fitness_function chromosome))
		(setq fitness_population7 (append fitness_population7 (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness7 (/ sum (length fitness_population7)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness7) (princ "\n")

	
	(setq previous_average_fitness7 average_fitness7)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness7 new_average_fitness7)


	  (if(= previous_average_fitness7 average_fitness7)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 
	)  ; end of iterator while
  ;********************************************************************************************************************************
  ;*********************************************************************************************************************************************************************
	(setq iterator 0)
  	(setq chance 0)
  
      (while
	    (and
	      (< iterator maximum_iterations)
	      (< chance 3)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list8 nil
	      mating_population8 nil
	      
              )

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list8 (stochasticUniversalSampling fitness_population8 5))  ;find segment which corresponds to the pointer and the corresponding index to the list

      ; (princ "\n")(princ selection_index_list0)
       ; (princ "selection ")(princ selection_index_list)
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list8
	  
	       (setq add_in_mating8 (list (nth value output8)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population8 (append mating_population8 add_in_mating8))
	)
    
    ;(princ "Mating pop ok with length ") (princ mating_population) (princ "\n")
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)

	 (while (< i 30)

	        (setq index1 (fix (* (length mating_population8) (randnum))))
		    (setq index2 (fix (* (length mating_population8) (randnum))))
	   
				  
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population8) (randnum))))
		      (setq index2 (fix (* (length mating_population8) (randnum))))
			)

			(setq parent1 (nth index1 mating_population8))
		    (setq parent2 (nth index2 mating_population8))

					 
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
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq chromosome (mutation chromosome))
		  )
	    )
	)
	

    
  

  	;|fitness check
   	(foreach chromosome generated_offsprings
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_offsprings (vl-remove chromosome generated_offsprings))
		)
	) |;
	
  	; Make new population

	

	(setq output8 generated_offsprings)
	  
	;(princ "Length of generated offspring is ")(princ (length final_population))(princ "\n")
    	
    
	
  	; Apply Fitness Function
  	
	;(setq fitness_population nil)

  	;(foreach chromosome final_population

	;  (setq value (fitness_function chromosome))
	 ; (setq fitness_population (append fitness_population (list value)))
	  
	  
	;)
	;(setq final_population temp_pop)

  	
  
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population8 nil)
	  
  	(foreach chromosome output8
	  	(setq value (fitness_function chromosome))
		(setq fitness_population8 (append fitness_population8 (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness8 (/ sum (length fitness_population8)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness8) (princ "\n")

	
	(setq previous_average_fitness8 average_fitness8)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness8 new_average_fitness8)


	  (if(= previous_average_fitness8 average_fitness8)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 
	)  ; end of iterator while
  ;********************************************************************************************************************************
  
;*********************************************************************************************************************************************************************
	(setq iterator 0)
  	(setq chance 0)
  
      (while
	    (and
	      (< iterator 10)
	      (< chance 3)
	    ) 
	 ;Selection of mating population
	  
  	(setq selection_index_list9 nil
	      mating_population9 nil
	      
              )

	;(princ "Initial_pop ok with length") (princ (length fitness_population)) (princ "\n")
	
	  
  	(setq selection_index_list9 (stochasticUniversalSampling fitness_population9 5))  ;find segment which corresponds to the pointer and the corresponding index to the list

      ; (princ "\n")(princ selection_index_list0)
       ; (princ "selection ")(princ selection_index_list)
    ;(princ "Selection Index List ok with length")(princ (length selection_index_list)) (princ "\n")
	;(setq count_select 0)
	(foreach value selection_index_list9
	  
	       (setq add_in_mating9 (list (nth value output9)))
            ;(if (> value 0)
             ; (setq count_select (+ count_select 1))
		    ;)
		   (setq mating_population9 (append mating_population9 add_in_mating9))
	)
    
    ;(princ "Mating pop ok with length ") (princ mating_population) (princ "\n")
	;(princ "positive solutions in mating population are ") (princ count_select)(princ "\n")

  	;;Choose Parents and Perform Crossover Operation
  	
  		;(princ iterator)(princ "\n")
		(setq i	0
		      parent1 nil
		      parent2 nil
		      temp_list	nil
		      generated_offsprings nil
		)

	 (while (< i 30)

	        (setq index1 (fix (* (length mating_population9) (randnum))))
		    (setq index2 (fix (* (length mating_population9) (randnum))))
	   
				  
		    (while (= index1 index2)
			  
	          (setq index1 (fix (* (length mating_population9) (randnum))))
		      (setq index2 (fix (* (length mating_population9) (randnum))))
			)

			(setq parent1 (nth index1 mating_population9))
		    (setq parent2 (nth index2 mating_population9))

					 
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
    	
   ;(princ "after crossover\n")
	  
	  ; Mutation Probability on GENERATED OFFSPRINGS
  	(foreach chromosome generated_offsprings
	  (setq rndn (randnum))
	  (if(< rndn mutation_probability)
		(progn
		    (setq chromosome (mutation chromosome))
		  )
	    )
	)
	

    
  

  	;|fitness check
   	(foreach chromosome generated_offsprings
		(setq value (fitness_function chromosome))
	  	(if (< value average_fitness)
			(setq generated_offsprings (vl-remove chromosome generated_offsprings))
		)
	) |;
	
  	; Make new population

	

	(setq output9 generated_offsprings)
	  
	;(princ "Length of generated offspring is ")(princ (length final_population))(princ "\n")
    	
    
	
  	; Apply Fitness Function
  	
	;(setq fitness_population nil)

  	;(foreach chromosome final_population

	;  (setq value (fitness_function chromosome))
	 ; (setq fitness_population (append fitness_population (list value)))
	  
	  
	;)
	;(setq final_population temp_pop)

  	
  
	; Apply Fitness Function to new population
	(setq sum 0)
  	(setq fitness_population9 nil)
	  
  	(foreach chromosome output9
	  	(setq value (fitness_function chromosome))
		(setq fitness_population9 (append fitness_population9 (list value)))
		(setq sum (+ sum value))
	  )

  	;Calculate Average Fitness
  	(setq new_average_fitness9 (/ sum (length fitness_population9)))

	(princ "Average fitness on iteration ") (princ iterator) (princ "  ") (princ new_average_fitness9) (princ "\n")

	
	(setq previous_average_fitness9 average_fitness9)
	  
	;(setq final_population new_population)
	  
	 (setq iterator (+ iterator 1))
	  
	 (setq average_fitness9 new_average_fitness9)


	  (if(= previous_average_fitness9 average_fitness9)
	    	(setq chance (+ chance 1))
		(setq chance 0)
	    )
    	 
	)  ; end of iterator while
  ;********************************************************************************************************************************