(defun migratio (  / final_pop12345)
  (setq itrater 0)
  ;(setq population nil)
  (setq population (numberofchromosomes 300 16))
  
  	(setq final_population nil)
        (setq added_population nil)
  
   (setq final_pop nil)
   (setq group0 (nth 0 population))
   (setq group1 (nth 1 population))
   (setq group2 (nth 2 population))
   (setq group3 (nth 3 population))
   (setq group4 (nth 4 population))
   (setq group5 (nth 5 population))
   (setq group6 (nth 6 population))
   (setq group7 (nth 7 population))
   (setq group8 (nth 8 population))
  (setq group9 (nth 9 population))
  (while (< itrater 3) ;(princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
    (setq	i 0)
	 (while (< i (length population))  ;selecting a random group other than group one

	        (setq index1 (fix (* (length population) (randnum1))))
		    
		    (if (= index1 0)
		    	  
	             (setq i (+ i 1))
		      
		      
		 
		     (setq i (length population))
		   )
          )
	 
     
    
     (setq rndgroup (nth index1 population)) ;(princ rndgroup)
     (foreach chromosome rndgroup
	  	(setq value (fitness_function chromosome))  
	  
		(setq fitness_population (append fitness_population (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ) ;(princ (length fitness_population))
     (setq maxchrome (apply 'max fitness_population))
    (setq indexv 0)
     (setq number 0)
     (setq numbe  0) ;(princ maxchrome)
    (foreach num fitness_population
       (setq indexv (+ indexv 1))
       (if (equal num maxchrome)
          (setq number (- indexv 1)) 
            )
    ); (princ number)
    ;(princ indexv)
  ;(princ group0)
  (foreach chromosome2 group0
	  	(setq value1 (fitness_function chromosome2))  
	  
		(setq fitness_population1 (append fitness_population1 (list value1)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ); (princ  fitness_population1)
  (setq minchrome(apply 'min fitness_population1)) ;(princ minchrome)
    (setq indexc 0)
  (foreach num1 fitness_population1
    (setq indexc (+ indexc 1))
      (if (equal num1 minchrome)
	(setq numbe (- indexc 1))
      )
  ) ;(princ numbe) (princ "\n")
  ;(princ group0)
  (princ "\n")
  
    (setq new (nth number rndgroup))
    (setq added_population(append added_population(list new)));(princ added_population)
 
    (setq temp1 0)
 ; (setq numbe (+ numbe 1))
(foreach chro added_population
         (if (equal chro new)
	  (setq temp 1 )


         )
 )     
   (if(= temp1 0)
     (progn
       (setq bex nil)
     (setq j 0)
    (while (< j (length group0))
		(if (= j numbe)
		  (setq bex bex)
		  (setq bex (append bex (list (nth j group0))))
		  
	        )

           (setq j (+ j 1))
    )
     
   ; (setq newgroup0 (replace group0  numbe))
    ;(princ gruop0)
  ;  (princ bex)(princ "\n")
  (setq bex (append bex (list new)))
        (setq group0 bex)
     ))
   
  (princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   ); end of itrator
 ; (princ group0)
  )
  (defun randnum1 (/ modulus multiplier increment random)
  (if (not seed)
    (setq seed (getvar "DATE"))
  )
  (setq	modulus	   65536
	multiplier 25173
	increment  13849
	seed	   (rem (+ (* multiplier seed) increment) modulus)
	random	   (/ seed modulus)
  )
)