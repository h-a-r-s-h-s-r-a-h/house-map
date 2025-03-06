(defun migration (population  / final_pop123)
  (setq itrater 0)
  ;(setq population nil)
 ;(setq population (numberofchromosomes 300 16))
        (setq mig_iter 6)
  	(setq final_population nil)
        (setq added_population nil)
  (setq best_individual nil)
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
  (setq index_list nil)
  (setq new_add_group0 nil)
 ; (setq index1 12)
  (while (< itrater mig_iter) ;(princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
    (setq	i 0)
   (setq dupli 0)
       
          (if (= (length index_list) 9)
             (setq index_list nil)
	    )
     ;(princ dupli)
	(while (< i 10)  ;selecting a random group other than group one
                (setq dupli 0)
	   (setq elem 0)
	        (setq index1 (fix (* 10 (randnum1))));(princ index1)(princ " ")
		    
		    (while (= index1 0) 
                     
		     (setq index1 (fix (* 10 (randnum1))))
                       
		      )
		     (if (/= index1 0) 
		      (progn
			
		       (foreach elem index_list
                           (if (= elem index1)                              
		                (setq dupli 1)
			     )
			)
		        
		       (if (= dulpi 1)
                           (setq i (+ i 1)))
		       (if (= dupli 0)
			     (progn (setq index_list(append index_list(list index1)))
                               (setq i 10)
			     )
			     )
			 
			 
		      )
		      
          )
	   )
     
       
    
     (setq rndgroup (nth index1 population)) ;(princ rndgroup)
     (foreach chromosome rndgroup
	  	(setq value (fitness_function chromosome))  
	  
		(setq fitness_population (append fitness_population (list value)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ); (princ (length fitness_population))
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
  );(princ numbe) (princ "\n")
  ;(princ group0)
  ;(princ "\n")
  
    (setq new (nth number rndgroup))
    
    
   
   (setq temp1 0)
 ; (setq numbe (+ numbe 1))
(foreach chro added_population
         (if (and (equal chro new)(< maxchrome minchrome))
           (progn
	       
	       (setq temp1 1 )
           )

         )
 )
   (if(= temp1 0)
     (progn
       (setq added_population(append added_population(list new)))
       (setq new_add_group0 (append new_add_group0 (list new)))
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
  ;(princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   )

  ; end of itrator
 ; (princ group0)
;*******************************************************************************************************
    (setq new_add_group1 nil)
    (setq itrater 0)
  (setq index_list nil)
   (while (< itrater mig_iter) ;(princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
   (setq	i 0)
   (setq dupli 0)
       
          (if (= (length index_list) 9)
             (setq index_list nil)
	    )
     ;(princ dupli)
	(while (< i 10)  ;selecting a random group other than group one
                (setq dupli 0)
	   (setq elem 0)
	        (setq index1 (fix (* 10 (randnum1))));(princ index1)(princ " ")
		    
		    (while (= index1 1) 
                     
		     (setq index1 (fix (* 10 (randnum1))))
                       
		      )
		     (if (/= index1 1) 
		      (progn
			
		       (foreach elem index_list
                           (if (= elem index1)                              
		                (setq dupli 1)
			     )
			)
		        
		       (if (= dulpi 1)
                           (setq i (+ i 1)))
		       (if (= dupli 0)
			     (progn (setq index_list(append index_list(list index1)))
                               (setq i 10)
			     )
			     )
			 
			 
		      )
		      
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
  (foreach chromosome2 group1
	  	(setq value1 (fitness_function chromosome2))  
	  
		(setq fitness_population1 (append fitness_population1 (list value1)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ) ;(princ  fitness_population1)
  (setq minchrome(apply 'min fitness_population1)) ;(princ minchrome)
    (setq indexc 0)
  (foreach num1 fitness_population1
    (setq indexc (+ indexc 1))
      (if (equal num1 minchrome)
	(setq numbe (- indexc 1))
      )
  ) ;(princ numbe) (princ "\n")
 ; (princ group1)
  ;(princ "\n")
  
    (setq new (nth number rndgroup))
  ;(setq bex nil)
 ; (setq numbe (+ numbe 1))
    
    (setq temp1 0)
 ; (setq numbe (+ numbe 1))
(foreach chrom new_add_group0
   (if (and (equal index1 0)(equal chrom new))
     (setq temp1 1 )
    )
 )
;(foreach chro added_population
         (if (< maxchrome minchrome)
  ;          
   ;         
	     (setq temp1 1 )
 ;          )
;
         )
      
   (if(= temp1 0)
     (progn
       (setq added_population(append added_population(list new)))
        (setq new_add_group1 (append new_add_group1 (list new)))
       (setq bex nil)
     (setq j 0)
    (while (< j (length group1))
		(if (= j numbe)
		  (setq bex bex)
		  (setq bex (append bex (list (nth j group1))))
		  
	        )

           (setq j (+ j 1))
    )
     
   ; (setq newgroup0 (replace group0  numbe))
    ;(princ gruop0)
  ;  (princ bex)(princ "\n")
  (setq bex (append bex (list new)))
        (setq group1 bex)
     ))
;  (princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   )
  ;*******************************************************************************************************
  (setq itrater 0)
    (setq new_add_group2 nil)
(setq index_list nil)
   (while (< itrater mig_iter) ;(princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
   (setq	i 0)
   (setq dupli 0)
       
          (if (= (length index_list) 9)
             (setq index_list nil)
	    )
     ;(princ dupli)
	(while (< i 10)  ;selecting a random group other than group one
                (setq dupli 0)
	   (setq elem 0)
	        (setq index1 (fix (* 10 (randnum1))));(princ index1)(princ " ")
		    
		    (while (= index1 2) 
                     
		     (setq index1 (fix (* 10 (randnum1))))
                       
		      )
		     (if (/= index1 2) 
		      (progn
			
		       (foreach elem index_list
                           (if (= elem index1)                              
		                (setq dupli 1)
			     )
			)
		        
		       (if (= dulpi 1)
                           (setq i (+ i 1)))
		       (if (= dupli 0)
			     (progn (setq index_list(append index_list(list index1)))
                               (setq i 10)
			     )
			     )
			 
			 
		      )
		      
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
  (foreach chromosome2 group2
	  	(setq value1 (fitness_function chromosome2))  
	  
		(setq fitness_population1 (append fitness_population1 (list value1)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ) ;(princ  fitness_population1)
  (setq minchrome(apply 'min fitness_population1)) ;(princ minchrome)
    (setq indexc 0)
  (foreach num1 fitness_population1
    (setq indexc (+ indexc 1))
      (if (equal num1 minchrome)
	(setq numbe (- indexc 1))
      )
  ) ;(princ numbe) (princ "\n")
 ; (princ group1)
 ; (princ "\n")
  
    (setq new (nth number rndgroup))
     
  (setq temp1 0)
 ; (setq numbe (+ numbe 1))
     (foreach chrom new_add_group0
   (if (and (equal index1 0)(equal chrom new))
     (setq temp1 1 )
    )
 )
     (foreach chrom1 new_add_group1
   (if (and (equal index1 1)(equal chrom1 new))
     (setq temp1 1 )
    )
 )
;(foreach chro added_population
         (if (< maxchrome minchrome)
	  (setq temp1 1 )


         )
 ;)     
   (if(= temp1 0)
     (progn
       (setq added_population(append added_population(list new)))
       (setq new_add_group2 (append new_add_group2 (list new)))
       (setq bex nil)
     (setq j 0)
    (while (< j (length group2))
		(if (= j numbe)
		  (setq bex bex)
		  (setq bex (append bex (list (nth j group2))))
		  
	        )

           (setq j (+ j 1))
    )
     
   ; (setq newgroup0 (replace group0  numbe))
    ;(princ gruop0)
  ;  (princ bex)(princ "\n")
  (setq bex (append bex (list new)))
        (setq group2 bex)
     ))
;  (princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   )
  ;*******************************************************************************************************
  (setq itrater 0)
     (setq new_add_group3 nil)
(setq index_list nil)
   (while (< itrater mig_iter) ;(princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
   (setq	i 0)
   (setq dupli 0)
       
          (if (= (length index_list) 9)
             (setq index_list nil)
	    )
     ;(princ dupli)
	(while (< i 10)  ;selecting a random group other than group one
                (setq dupli 0)
	   (setq elem 0)
	        (setq index1 (fix (* 10 (randnum1))));(princ index1)(princ " ")
		    
		    (while (= index1 3) 
                     
		     (setq index1 (fix (* 10 (randnum1))))
                       
		      )
		     (if (/= index1 3) 
		      (progn
			
		       (foreach elem index_list
                           (if (= elem index1)                              
		                (setq dupli 1)
			     )
			)
		        
		       (if (= dulpi 1)
                           (setq i (+ i 1)))
		       (if (= dupli 0)
			     (progn (setq index_list(append index_list(list index1)))
                               (setq i 10)
			     )
			     )
			 
			 
		      )
		      
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
  (foreach chromosome2 group3
	  	(setq value1 (fitness_function chromosome2))  
	  
		(setq fitness_population1 (append fitness_population1 (list value1)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ) ;(princ  fitness_population1)
  (setq minchrome(apply 'min fitness_population1)) ;(princ minchrome)
    (setq indexc 0)
  (foreach num1 fitness_population1
    (setq indexc (+ indexc 1))
      (if (equal num1 minchrome)
	(setq numbe (- indexc 1))
      )
  ) ;(princ numbe) (princ "\n")
  ;(princ group3)
  ;(princ "\n")
  
    (setq new (nth number rndgroup))
    
   (setq temp1 0)
 ; (setq numbe (+ numbe 1))
     (foreach chrom new_add_group0
   (if (and (equal index1 0)(equal chrom new))
     (setq temp1 1 )
    )
 )
     (foreach chrom1 new_add_group1
   (if (and (equal index1 1)(equal chrom1 new))
     (setq temp1 1 )
    )
 )
     (foreach chrom2 new_add_group2
   (if (and (equal index1 2)(equal chrom2 new))
     (setq temp1 1 )
    )
 )
;(foreach chro added_population
         (if (< maxchrome minchrome)
	  (setq temp1 1 )


         )
 ;)     
   (if(= temp1 0)
     (progn
        (setq added_population(append added_population(list new)))
       (setq new_add_group3 (append new_add_group3 (list new)))
       (setq bex nil)
     (setq j 0)
    (while (< j (length group3))
		(if (= j numbe)
		  (setq bex bex)
		  (setq bex (append bex (list (nth j group3))))
		  
	        )

           (setq j (+ j 1))
    )
     
   ; (setq newgroup0 (replace group0  numbe))
    ;(princ gruop0)
  ;  (princ bex)(princ "\n")
  (setq bex (append bex (list new)))
        (setq group3 bex)
     ))
 ; (princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   )
  ;*******************************************************************************************************
  (setq itrater 0)
     (setq new_add_group4 nil)
(setq index_list nil)
   (while (< itrater mig_iter) ;(princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
   (setq	i 0)
   (setq dupli 0)
       
          (if (= (length index_list) 9)
             (setq index_list nil)
	    )
     ;(princ dupli)
	(while (< i 10)  ;selecting a random group other than group one
                (setq dupli 0)
	   (setq elem 0)
	        (setq index1 (fix (* 10 (randnum1))));(princ index1)(princ " ")
		    
		    (while (= index1 4) 
                     
		     (setq index1 (fix (* 10 (randnum1))))
                       
		      )
		     (if (/= index1 4) 
		      (progn
			
		       (foreach elem index_list
                           (if (= elem index1)                              
		                (setq dupli 1)
			     )
			)
		        
		       (if (= dulpi 1)
                           (setq i (+ i 1)))
		       (if (= dupli 0)
			     (progn (setq index_list(append index_list(list index1)))
                               (setq i 10)
			     )
			     )
			 
			 
		      )
		      
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
  (foreach chromosome2 group4
	  	(setq value1 (fitness_function chromosome2))  
	  
		(setq fitness_population1 (append fitness_population1 (list value1)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ) ;(princ  fitness_population1)
  (setq minchrome(apply 'min fitness_population1)) ;(princ minchrome)
    (setq indexc 0)
  (foreach num1 fitness_population1
    (setq indexc (+ indexc 1))
      (if (equal num1 minchrome)
	(setq numbe (- indexc 1))
      )
  ) ;(princ numbe) (princ "\n")
  ;(princ group4)
  ;(princ "\n")
  
    (setq new (nth number rndgroup))
    
   (setq temp1 0)
 ; (setq numbe (+ numbe 1))
     (foreach chrom new_add_group0
   (if (and (equal index1 0)(equal chrom new))
     (setq temp1 1 )
    )
 )
     (foreach chrom1 new_add_group1
   (if (and (equal index1 1)(equal chrom1 new))
     (setq temp1 1 )
    )
 )
     (foreach chrom2 new_add_group2
   (if (and (equal index1 2)(equal chrom2 new))
     (setq temp1 1 )
    )
 )
     (foreach chrom3 new_add_group3
   (if (and (equal index1 3)(equal chrom3 new))
     (setq temp1 1 )
    )
 )
;(foreach chro added_population
         (if (< maxchrome minchrome)
	  (setq temp1 1 )


         )
 
   (if(= temp1 0)
     (progn
        (setq added_population(append added_population(list new)))
       (setq new_add_group4 (append new_add_group4 (list new)))
       (setq bex nil)
     (setq j 0)
    (while (< j (length group4))
		(if (= j numbe)
		  (setq bex bex)
		  (setq bex (append bex (list (nth j group4))))
		  
	        )

           (setq j (+ j 1))
    )
     
   ; (setq newgroup0 (replace group0  numbe))
    ;(princ gruop0)
  ;  (princ bex)(princ "\n")
  (setq bex (append bex (list new)))
        (setq group4 bex)
     ))
  ;(princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   )
  ;*******************************************************************************************************
  (setq itrater 0)
(setq index_list nil)
   (setq new_add_group5 nil)
   (while (< itrater mig_iter) ;(princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
  (setq	i 0)
   (setq dupli 0)
       
          (if (= (length index_list) 9)
             (setq index_list nil)
	    )
     ;(princ dupli)
	(while (< i 10)  ;selecting a random group other than group one
                (setq dupli 0)
	   (setq elem 0)
	        (setq index1 (fix (* 10 (randnum1))));(princ index1)(princ " ")
		    
		    (while (= index1 5) 
                     
		     (setq index1 (fix (* 10 (randnum1))))
                       
		      )
		     (if (/= index1 5) 
		      (progn
			
		       (foreach elem index_list
                           (if (= elem index1)                              
		                (setq dupli 1)
			     )
			)
		        
		       (if (= dulpi 1)
                           (setq i (+ i 1)))
		       (if (= dupli 0)
			     (progn (setq index_list(append index_list(list index1)))
                               (setq i 10)
			     )
			     )
			 
			 
		      )
		      
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
  (foreach chromosome2 group5
	  	(setq value1 (fitness_function chromosome2))  
	  
		(setq fitness_population1 (append fitness_population1 (list value1)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ) ;(princ  fitness_population1)
  (setq minchrome(apply 'min fitness_population1)) ;(princ minchrome)
    (setq indexc 0)
  (foreach num1 fitness_population1
    (setq indexc (+ indexc 1))
      (if (equal num1 minchrome)
	(setq numbe (- indexc 1))
      )
  ) ;(princ numbe) (princ "\n")
  ;(princ group5)
  ;(princ "\n")
  
    (setq new (nth number rndgroup))
     
  (setq temp1 0)
 ; (setq numbe (+ numbe 1))
         (foreach chrom new_add_group0
   (if (and (equal index1 0)(equal chrom new))
     (setq temp1 1 )
    )
 )
     (foreach chrom1 new_add_group1
   (if (and (equal index1 1)(equal chrom1 new))
     (setq temp1 1 )
    )
 )
     (foreach chrom2 new_add_group2
   (if (and (equal index1 2)(equal chrom2 new))
     (setq temp1 1 )
    )
 )
     (foreach chrom3 new_add_group3
   (if (and (equal index1 3)(equal chrom3 new))
     (setq temp1 1 )
    )
 )
      (foreach chrom4 new_add_group4
   (if (and (equal index1 4)(equal chrom4 new))
     (setq temp1 1 )
    )
 )
 (if (< maxchrome minchrome)
	  (setq temp1 1 )


         )
   (if(= temp1 0)
     (progn
        (setq added_population(append added_population(list new)))
        (setq new_add_group5 (append new_add_group5 (list new)))
       (setq bex nil)
     (setq j 0)
    (while (< j (length group5))
		(if (= j numbe)
		  (setq bex bex)
		  (setq bex (append bex (list (nth j group5))))
		  
	        )

           (setq j (+ j 1))
    )
     
   ; (setq newgroup0 (replace group0  numbe))
    ;(princ gruop0)
  ;  (princ bex)(princ "\n")
  (setq bex (append bex (list new)))
        (setq group5 bex)
     ))
  ;(princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   )
  ;*******************************************************************************************************
  (setq itrater 0)
(setq index_list nil)
   (setq new_add_group6 nil)
   (while (< itrater mig_iter) ;(princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
    (setq	i 0)
   (setq dupli 0)
       
          (if (= (length index_list) 9)
             (setq index_list nil)
	    )
     ;(princ dupli)
	(while (< i 10)  ;selecting a random group other than group one
                (setq dupli 0)
	   (setq elem 0)
	        (setq index1 (fix (* 10 (randnum1))));(princ index1)(princ " ")
		    
		    (while (= index1 6) 
                     
		     (setq index1 (fix (* 10 (randnum1))))
                       
		      )
		     (if (/= index1 6) 
		      (progn
			
		       (foreach elem index_list
                           (if (= elem index1)                              
		                (setq dupli 1)
			     )
			)
		        
		       (if (= dulpi 1)
                           (setq i (+ i 1)))
		       (if (= dupli 0)
			     (progn (setq index_list(append index_list(list index1)))
                               (setq i 10)
			     )
			     )
			 
			 
		      )
		      
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
  (foreach chromosome2 group6
	  	(setq value1 (fitness_function chromosome2))  
	  
		(setq fitness_population1 (append fitness_population1 (list value1)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ) ;(princ  fitness_population1)
  (setq minchrome(apply 'min fitness_population1)) ;(princ minchrome)
    (setq indexc 0)
  (foreach num1 fitness_population1
    (setq indexc (+ indexc 1))
      (if (equal num1 minchrome)
	(setq numbe (- indexc 1))
      )
  ) ;(princ numbe) (princ "\n")
  ;(princ group6)
  ;(princ "\n")
    
    (setq new (nth number rndgroup))
    
   (setq temp1 0)
 ; (setq numbe (+ numbe 1))
   (foreach chrom new_add_group0
   (if (and (equal index1 0)(equal chrom new))
     (setq temp1 1 )
    )
 )
     (foreach chrom1 new_add_group1
   (if (and (equal index1 1)(equal chrom1 new))
     (setq temp1 1)
    )
 )
     (foreach chrom2 new_add_group2
   (if (and (equal index1 2)(equal chrom2 new))
     (setq temp1 1)
    )
 )
     (foreach chrom3 new_add_group3
   (if (and (equal index1 3)(equal chrom3 new))
     (setq temp1 1)
    )
 )
      (foreach chrom4 new_add_group4
   (if (and (equal index1 4)(equal chrom4 new))
     (setq temp1 1)
    )
 )
     (foreach chrom5 new_add_group5
   (if (and (equal index1 5)(equal chrom5 new))
     (setq temp1 1)
    )
 )   
 (if (< maxchrome minchrome)
	  (setq temp1 1)


         )
   
   (if(= temp1 0)
     (progn
        (setq added_population(append added_population(list new)))
        (setq new_add_group6 (append new_add_group6 (list new)))
       (setq bex nil)
     (setq j 0)
    (while (< j (length group6))
		(if (= j numbe)
		  (setq bex bex)
		  (setq bex (append bex (list (nth j group6))))
		  
	        )

           (setq j (+ j 1))
    )
     
   ; (setq newgroup0 (replace group0  numbe))
    ;(princ gruop0)
  ;  (princ bex)(princ "\n")
  (setq bex (append bex (list new)))
        (setq group6 bex)
     ))
 ; (princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   )
  ;*******************************************************************************************************
  
  ;*******************************************************************************************************
  (setq itrater 0)
(setq index_list nil)
   (setq new_add_group7 nil)
   (while (< itrater mig_iter) ;(princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
   (setq	i 0)
   (setq dupli 0)
       
          (if (= (length index_list) 9)
             (setq index_list nil)
	    )
     ;(princ dupli)
	(while (< i 10)  ;selecting a random group other than group one
                (setq dupli 0)
	   (setq elem 0)
	        (setq index1 (fix (* 10 (randnum1))));(princ index1)(princ " ")
		    
		    (while (= index1 7) 
                     
		     (setq index1 (fix (* 10 (randnum1))))
                       
		      )
		     (if (/= index1 7) 
		      (progn
			
		       (foreach elem index_list
                           (if (= elem index1)                              
		                (setq dupli 1)
			     )
			)
		        
		       (if (= dulpi 1)
                           (setq i (+ i 1)))
		       (if (= dupli 0)
			     (progn (setq index_list(append index_list(list index1)))
                               (setq i 10)
			     )
			     )
			 
			 
		      )
		      
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
  (foreach chromosome2 group7
	  	(setq value1 (fitness_function chromosome2))  
	  
		(setq fitness_population1 (append fitness_population1 (list value1)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ) ;(princ  fitness_population1)
  (setq minchrome(apply 'min fitness_population1)) ;(princ minchrome)
    (setq indexc 0)
  (foreach num1 fitness_population1
    (setq indexc (+ indexc 1))
      (if (equal num1 minchrome)
	(setq numbe (- indexc 1))
      )
  ) ;(princ numbe) (princ "\n")
  ;(princ group7)
  ;(princ "\n")
  
    (setq new (nth number rndgroup))
   
    
  (setq temp1 0)
 ; (setq numbe (+ numbe 1))
       (foreach chrom new_add_group0
   (if (and (equal index1 0)(equal chrom new))
     (setq temp1 1)
    )
 )
     (foreach chrom1 new_add_group1
   (if (and (equal index1 1)(equal chrom1 new))
     (setq temp1 1)
    )
 )
     (foreach chrom2 new_add_group2
   (if (and (equal index1 2)(equal chrom2 new))
     (setq temp1 1)
    )
 )
     (foreach chrom3 new_add_group3
   (if (and (equal index1 3)(equal chrom3 new))
     (setq temp1 1)
    )
 )
      (foreach chrom4 new_add_group4
   (if (and (equal index1 4)(equal chrom4 new))
     (setq temp1 1)
    )
 )
     (foreach chrom5 new_add_group5
   (if (and (equal index1 5)(equal chrom5 new))
     (setq temp1 1)
    )
 )
      (foreach chrom6 new_add_group6
   (if (and (equal index1 6)(equal chrom6 new))
     (setq temp1 1)
    )
 )   
 (if (< maxchrome minchrome)
	  (setq temp1 1)


         )    
   (if(= temp1 0)
     (progn
        (setq added_population(append added_population(list new)))
        (setq new_add_group7 (append new_add_group7 (list new)))
       (setq bex nil)
     (setq j 0)
    (while (< j (length group7))
		(if (= j numbe)
		  (setq bex bex)
		  (setq bex (append bex (list (nth j group7))))
		  
	        )

           (setq j (+ j 1))
    )
     
   ; (setq newgroup0 (replace group0  numbe))
    ;(princ gruop0)
  ;  (princ bex)(princ "\n")
  (setq bex (append bex (list new)))
        (setq group7 bex)
     ))
 ; (princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   )
    ;*******************************************************************************************************
  (setq itrater 0)
(setq index_list nil)
   (setq new_add_group8 nil)
   (while (< itrater mig_iter) ;(princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
   (setq	i 0)
   (setq dupli 0)
       
          (if (= (length index_list) 9)
             (setq index_list nil)
	    )
     ;(princ dupli)
	(while (< i 10)  ;selecting a random group other than group one
                (setq dupli 0)
	   (setq elem 0)
	        (setq index1 (fix (* 10 (randnum1))));(princ index1)(princ " ")
		    
		    (while (= index1 8) 
                     
		     (setq index1 (fix (* 10 (randnum1))))
                       
		      )
		     (if (/= index1 8) 
		      (progn
			
		       (foreach elem index_list
                           (if (= elem index1)                              
		                (setq dupli 1)
			     )
			)
		        
		       (if (= dulpi 1)
                           (setq i (+ i 1)))
		       (if (= dupli 0)
			     (progn (setq index_list(append index_list(list index1)))
                               (setq i 10)
			     )
			     )
			 
			 
		      )
		      
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
  (foreach chromosome2 group8
	  	(setq value1 (fitness_function chromosome2))  
	  
		(setq fitness_population1 (append fitness_population1 (list value1)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ) ;(princ  fitness_population1)
  (setq minchrome(apply 'min fitness_population1)) ;(princ minchrome)
    (setq indexc 0)
  (foreach num1 fitness_population1
    (setq indexc (+ indexc 1))
      (if (equal num1 minchrome)
	(setq numbe (- indexc 1))
      )
  ) ;(princ numbe) (princ "\n")
  ;(princ group8)
  ;(princ "\n")
  
    (setq new (nth number rndgroup))
   
   (setq temp1 0)
 ; (setq numbe (+ numbe 1))
           (foreach chrom new_add_group0
   (if (and (equal index1 0)(equal chrom new))
     (setq temp1 1)
    )
 )
     (foreach chrom1 new_add_group1
   (if (and (equal index1 1)(equal chrom1 new))
     (setq temp1 1)
    )
 )
     (foreach chrom2 new_add_group2
   (if (and (equal index1 2)(equal chrom2 new))
     (setq temp1 1)
    )
 )
     (foreach chrom3 new_add_group3
   (if (and (equal index1 3)(equal chrom3 new))
     (setq temp1 1)
    )
 )
      (foreach chrom4 new_add_group4
   (if (and (equal index1 4)(equal chrom4 new))
     (setq temp1 1)
    )
 )
     (foreach chrom5 new_add_group5
   (if (and (equal index1 5)(equal chrom5 new))
     (setq temp1 1)
    )
 )
      (foreach chrom6 new_add_group6
   (if (and (equal index1 6)(equal chrom6 new))
     (setq temp1 1)
    )
 )
      (foreach chrom7 new_add_group7
   (if (and (equal index1 7)(equal chrom7 new))
     (setq temp1 1)
    )
 )   
;(foreach chro added_population
          (if (< maxchrome minchrome)
	  (setq temp1 1)


         )
 ;)     
   (if(= temp1 0)
     (progn
        (setq added_population(append added_population(list new)))
        (setq new_add_group8 (append new_add_group8 (list new)))
       (setq bex nil)
     (setq j 0)
    (while (< j (length group8))
		(if (= j numbe)
		  (setq bex bex)
		  (setq bex (append bex (list (nth j group8))))
		  
	        )

           (setq j (+ j 1))
    )
     
   ; (setq newgroup0 (replace group0  numbe))
    ;(princ gruop0)
  ;  (princ bex)(princ "\n")
  (setq bex (append bex (list new)))
        (setq group8 bex)
     ))
 ; (princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   )
      ;*******************************************************************************************************
  (setq itrater 0)
(setq index_list nil)
   (while (< itrater mig_iter); (princ itrater)(princ "\n")
   
  	(setq fitness_population nil)
        (setq fitness_population1 nil)
  	(setq final_population1 nil)
    (setq	i 0)
   (setq dupli 0)
       
          (if (= (length index_list) 9)
             (setq index_list nil)
	    )
     ;(princ dupli)
	(while (< i 10)  ;selecting a random group other than group one
                (setq dupli 0)
	   (setq elem 0)
	        (setq index1 (fix (* 10 (randnum1))));(princ index1)(princ " ")
		    
		    (while (= index1 9) 
                     
		     (setq index1 (fix (* 10 (randnum1))))
                       
		      )
		     (if (/= index1 9) 
		      (progn
			
		       (foreach elem index_list
                           (if (= elem index1)                              
		                (setq dupli 1)
			     )
			)
		        
		       (if (= dulpi 1)
                           (setq i (+ i 1)))
		       (if (= dupli 0)
			     (progn (setq index_list(append index_list(list index1)))
                               (setq i 10)
			     )
			     )
			 
			 
		      )
		      
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
  (foreach chromosome2 group9
	  	(setq value1 (fitness_function chromosome2))  
	  
		(setq fitness_population1 (append fitness_population1 (list value1)))   ;in fitness_population the fitness value of each chromosome is appended
	  	
	  ) ;(princ  fitness_population1)
  (setq minchrome(apply 'min fitness_population1)) ;(princ minchrome)
    (setq indexc 0)
  (foreach num1 fitness_population1
    (setq indexc (+ indexc 1))
      (if (equal num1 minchrome)
	(setq numbe (- indexc 1))
      )
  ) ;(princ numbe) (princ "\n")
  ;(princ group9)
  ;(princ "\n")
  
    (setq new (nth number rndgroup))
    
  (setq temp1 0)
 ; (setq numbe (+ numbe 1))
             (foreach chrom new_add_group0
   (if (and (equal index1 0)(equal chrom new))
     (setq temp1 1)
    )
 )
     (foreach chrom1 new_add_group1
   (if (and (equal index1 1)(equal chrom1 new))
     (setq temp1 1)
    )
 )
     (foreach chrom2 new_add_group2
   (if (and (equal index1 2)(equal chrom2 new))
     (setq temp1 1)
    )
 )
     (foreach chrom3 new_add_group3
   (if (and (equal index1 3)(equal chrom3 new))
     (setq temp1 1)
    )
 )
      (foreach chrom4 new_add_group4
   (if (and (equal index1 4)(equal chrom4 new))
     (setq temp1 1)
    )
 )
     (foreach chrom5 new_add_group5
   (if (and (equal index1 5)(equal chrom5 new))
     (setq temp1 1)
    )
 )
      (foreach chrom6 new_add_group6
   (if (and (equal index1 6)(equal chrom6 new))
     (setq temp1 1)
    )
 )
      (foreach chrom7 new_add_group7
   (if (and (equal index1 7)(equal chrom7 new))
     (setq temp1 1)
    )
 )
      (foreach chrom8 new_add_group8
   (if (and (equal index1 8)(equal chrom8 new))
     (setq temp1 1)
    )
 )  
;(foreach chro added_population
         (if (< maxchrome minchrome)
	  (setq temp1 1)


         )
 ;)     
   (if(= temp1 0)
     (progn
        (setq added_population(append added_population(list new)))
       (setq bex nil)
     (setq j 0)
    (while (< j (length group9))
		(if (= j numbe)
		  (setq bex bex)
		  (setq bex (append bex (list (nth j group9))))
		  
	        )

           (setq j (+ j 1))
    )
     
   ; (setq newgroup0 (replace group0  numbe))
    ;(princ gruop0)
  ;  (princ bex)(princ "\n")
  (setq bex (append bex (list new)))
        (setq group9 bex)
     ))
  ;(princ bex)
  ; (replace-n1 (new number1 group0)
  ;(setq (= (nth value1 group0)(nth value0 rndgroup)))

  (setq itrater (+ itrater 1))
   )
  
 ;(princ "\n")(princ group0)
  ;(princ "\n")(princ group1)
;(princ "\n")(princ group2)
;(princ "\n")(princ group15)
;(princ "\n")(princ group4)
;(princ "\n")(princ group5)
;(princ "\n")(princ group6)
;(princ "\n")(princ group7)
;(princ "\n")(princ group8)
;(princ "\n")(princ group9)

 ;(setq best_individual (apply 'max (added_population)))
  
  (setq final_pop123 (list group0 group1 group2 group3 group4 group5 group6 group7 group8 group9))
  
)
;(princ final_pop123)


  ;(princ final_pop123)
  ;(newGA1 final_pop123)


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
(defun replace-n1 (new n lst / )
  (mapcar '(lambda (a) (if (= (setq n (1- n)) -1) new a)) lst)
  )
  ;this module is used to create random chromosomes


    