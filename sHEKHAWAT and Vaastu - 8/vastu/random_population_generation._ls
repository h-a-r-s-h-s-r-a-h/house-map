;this module is used to create random chromosomes

(defun numberofchromosomes (numberC numberSpaces / i final)
	(setq i 0
              output0 nil
	      output1 nil
              output2 nil
	      output3 nil
	      output4 nil
	      output5 nil
	      output6 nil
	      output7 nil
	      output8 nil
	      output9 nil
	      )
  	(while(< i numberC)	  
	  (setq group (random_gen numberSpaces))
	  (cond
	    ((= (/ i 10) 0)
	     (setq output0 (append output0 (list group)))
	    )
	    ((= (/ i 10) 1)
	     (setq output1 (append output1 (list group)))
	    )
	    ((= (/ i 10) 2)
	     (setq output2 (append output2(list group)))
	    )
	    ((= (/ i 10) 3)
	     (setq output3 (append output3 (list group)))
	    )
	    ((= (/ i 10) 4)
	     (setq output4 (append output4 (list group)))
	    )
	     ((= (/ i 10) 5)
	     (setq output5(append output5 (list group)))
	      )
	     ((= (/ i 10) 6)
	     (setq output6(append output6 (list group)))
	      )
	     ((= (/ i 10) 7)
	     (setq output7 (append output7 (list group)))
	      )
	     ((= (/ i 10) 8)
	     (setq output8 (append output8 (list group)))
	      )
	    ((= (/ i 10) 9)
	     (setq output9 (append output9 (list group)))
	      )
	  )
	  (setq i (+ i 1))
	    
	  )
        
     
           ;   (setq output0 output0) ;(princ output0)(princ "\n")
	    ;  (setq output1 output1)   ;(princ output1)(princ "\n")
	     ; (setq output2 output2)  ;(princ output2)(princ "\n")
              ;(setq output3 output3)  ;(princ output3)(princ "\n")
	      ;(setq output4 output4)  ;(princ output4)(princ "\n")
	      ;(setq output5 output5)  ;(princ output5)(princ "\n")
	      ;(setq output6 output6)  ;(princ output6)(princ "\n")
	      ;(setq output7 output7)  ;(princ output7)(princ "\n")
	      ;(setq output8 output8)  ;(princ output8)(princ "\n")
	      ;(setq output9 output9)
       (setq final (list output0 output1 output2 output3 output4 output5 output6 output7 output8 output9))
       ;(migrat final)
  )


(defun rnd (/ modulus multiplier increment random)
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
 ;|

To use rnd between 0-20 write (fix(* 20 (rnd))

|;


(defun check (m / k)
  (setq k 0)
  (setq condition 0)
  (while (< k (length check_array))
    (if	(= m (nth k check_array))
      (progn
	(if (= condition 0)
	  (setq condition 1)
	)
      )
    )
    (setq k (+ k 1))
  )
  (if (= condition 0)
    (progn
      (setq check_array (cons m check_array))
      (setq condition 0)
    )
  )
  
)

 ;|
	To check the random number is unique
|;



;this module is used to generate the groups of numberspaces or chromosomes 
(defun random_gen (numberSpaces / group number selected g1 g2 g3 g4)
    (setq g1 nil
	  g2 nil
	  g3 nil
	  g4 nil
	 ; g5 nil
    )
    (setq group nil)
    (setq condition 1)
    (setq check_array nil)
    (while (/= (length check_array) numberSpaces)
      (setq number (fix (* numberSpaces (rnd))))
      (check number)
      
      (if (= condition 0)
	(progn
	  (setq group_number (fix (* 4 (rnd))))
	  (setq selected number)
					;(princ selected)
					;(princ)
					;(princ number)
					;(princ group_number)
					;(princ)
	  (cond
	    ((= group_number 0)
	     (if (/= (length g1) 4) 
              (progn
	       (setq g1 (cons selected g1))
	       )
	       (progn
		 (if (/= (length g2) 4) 
                   (progn
		   (setq g2 (cons selected g2))
		   )
		   (progn
		     (if (/= (length g3) 4)
                       (progn
		       (setq g3 (cons selected g3))
		       )
		       (progn
			   (setq g4 (cons selected g4))
		       )
		     )
	           )
		   )
		 )
	       )
	     )
	   ((= group_number 1)
	     (if (/= (length g2) 4) 
              (progn
	       (setq g2 (cons selected g2))
	       )
	       (progn
		 (if (/= (length g1) 4) 
                   (progn
		   (setq g1 (cons selected g1))
		   )
		   (progn
		     (if (/= (length g3) 4)
                       (progn
		       (setq g3 (cons selected g3))
		       )
		       (progn
			   (setq g4 (cons selected g4))
		       )
		     )
	           )
		   )
		 )
	       )
	     )
	   ((= group_number 2)
	     (if (/= (length g3) 4) 
              (progn
	       (setq g3 (cons selected g3))
	       )
	       (progn
		 (if (/= (length g2) 4) 
                   (progn
		   (setq g2 (cons selected g2))
		   )
		   (progn
		     (if (/= (length g1) 4)
                       (progn
		       (setq g1 (cons selected g1))
		       )
		       (progn
			   (setq g4 (cons selected g4))
		       )
		     )
	           )
		   )
		 )
	       )
	     )
	    ((= group_number 3)
	     (if (/= (length g4) 4) 
              (progn
	       (setq g4 (cons selected g4))
	       )
	       (progn
		 (if (/= (length g2) 4) 
                   (progn
		   (setq g2 (cons selected g2))
		   )
		   (progn
		     (if (/= (length g3) 4)
                       (progn
		       (setq g3 (cons selected g3))
		       )
		       (progn
			   (setq g1 (cons selected g1))
		       )
		     )
	           )
		   )
		 )
	       )
	     )
	   ; ((= group_number 4)
	    ; (setq g5 (cons selected g5))
	    ;)
	  )
	)
      )
    )
    (if	(= (length g1) 4)
      (setq group (cons g1 group))
    )
    (if	(= (length g2) 4)
      (setq group (cons g2 group))
    )
    (if	(= (length g3) 4)
      (setq group (cons g3 group))
    )
    (if	(= (length g4) 4)
      (setq group (cons g4 group))
    )
   ; (if	(>= (length g5) 2)
    ;  (setq group (cons g5 group))
    ;)
    (setq group group)
  
    
)