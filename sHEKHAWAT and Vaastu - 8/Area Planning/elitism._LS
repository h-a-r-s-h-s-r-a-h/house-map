(defun selectTopElements (population fitnessPopualtion numberOfElements / maxElements)
  (setq maxElements nil)
  (setq indexList nil)
  (setq i 0)
  ;(setq best_population_i nil)
  ;(princ "elit")
  (setq pop_i numberOfElements)
  (if (= (length best_population) 0)
    (progn
      (setq fitness_pop nil)
      ;(setq best_population nil)
      (setq th 0)
      (while (< th pop_i)
	(setq fitness_pop (append fitness_pop (list (nth th fitnessPopulation))))
	(setq best_population (append best_population (list (nth th population))))
        (setq th (+ th 1))
	)
      )
    (progn
       
    
    ;|(if (> (length fitnessPopulation) numberOfElements)
	   
	  (progn
		(while (< i numberofElements)
		  
	    (setq index (vl-position (apply 'max fitnessPopulation) fitnessPopulation))
            (setq indexList (append indexList (list index)))
            (setq best_population_i(append best_population_i (list (nth index population))))
	    (setq fitnessPopulation (replace-n 0 index fitnessPopulation))
	    (setq i (+ i 1))
        )
	  )
	  (progn
		(while (< i (length fitnessPopulation))
	    (setq index (vl-position (apply 'max fitnessPopulation) fitnessPopulation))
	    (setq indexList (append indexList (list index)))
	    (setq fitnessPopulation (replace-n 0 index fitnessPopulation))
	    (setq i (+ i 1))
        )

	  )
	)|;
  (setq i 0)
   (while (< i numberOfElements)
      (if (> (apply 'max fitnessPopulation) (apply 'min fitness_pop))
	  (progn
	     (setq maximum (apply 'max fitnessPopulation)) 
             (setq index (vl-position (apply 'min fitness_pop) fitness_pop))
	     (setq index1 (vl-position (apply 'max fitnessPopulation) fitnessPopulation))
             (setq fitness_pop (replace-n maximum index fitness_pop))
             (setq fitnessPopulation (replace-n 0 index1 fitnessPopulation))
	     (setq best_population (replace-n (nth index1 population) index best_population))
          )
	(progn
	  (setq best_population best_poopulation)
          (setq fitness_pop fitness_pop)


	 )
        )
     (setq i (+ i 1))
     )
  )
    )

  best_population
  
  
 
  )