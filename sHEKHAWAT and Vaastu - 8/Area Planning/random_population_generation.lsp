;this module is used to create random chromosome
;((15 3 13 8) (12 4 6 11) (2 0 14 1) (10 9 5 7))
;8.9625 ((15 3 8 5) (11 13 7 6) (0 4 14 1) (10 9 12 2))
(setq ginc 0)
(setq group_g1 nil)
(setq group_g nil)
  (setq indivi (list (list  6 5)(list 2 3)(list 4 1)(list 7 0)))
  (setq ki 0)
 ; (setq off nil)
(setq group_gene nil)
(while (< ki (length indivi))
  (setq group_gene (nth ki indivi))
  ;(princ "\n")(princ childnew1)
  ;(princ "cross4")(princ "\n")
  (setq checked nil)
      (setq group123 nil)
      (setq h11 0)
      (setq mii 0)
  (setq checked (append checked (list 10000)))
       (while (< h11 (length group_gene))
	   (if (= h11 0)
	       (progn
		     (setq space11 (nth mii group_gene))
		     ;(drawrect space di)
		     (setq group123 (append group123(list space11)))
		; (princ "h==>")
		 ;(princ  space11)
		)
	       (progn
                      ;(setq ji (- j 1))
		      (setq k 0)
		 ;(princ  "\n")
		 ;(princ "h==>")
		   ;    (princ h11)
		 (setq checked(append checked(list space11)))
		      (setq k (maxprox space11 group_gene checked))
		  ;|(setq ig 0)
		      (while (/= k (nth ig group_gene))
			  (setq ig (+ ig 1))
			)|;
		; (princ  "\n")
		 ;(princ "k==>")
                  ;    (princ  k)
		 
		      ;(drawrect k di)                         ; termin will be set by drawrect when sol is not possible
                        (setq group123(append group123(list k)))
		 (setq space11 k)
		     ; (if (= termin 1)
                      ;    (setq j (length group))
			  ;
			;)
		
		 )
	     )
	     (setq h11 (+ h11 1))
	     
	 )
  (setq ki (+ ki 1))
(setq group_g(append group_g(list group123)))
  )
(princ group_g);((6 2) (3 5) (4 7) (0 1))
 (setq group_g (list (list (nth 0 (nth 0 group_g))  (nth 0 (nth 1 group_g))  )
		     (list (nth 1 (nth 1 group_g))  (nth 1 (nth 0 group_g))  )
		     (list (nth 0 (nth 2 group_g))   (nth 0 (nth 3 group_g)) )
		     (list (nth 1 (nth 3 group_g))   (nth 1 (nth 2 group_g))  )
		     ))
(princ group_g)
(while (< ginc (length group_g))
  (setq gj (nth ginc group_g))
  (setq gi 0)
  (while (< gi (length gj))
     (setq group_g1(append group_g1(list (nth gi gj))))
    (setq gi (+ gi 1))
   )
  (setq ginc (+ ginc 1))
  )
;(princ group_g1)
;(setq group_g1 (list 6  2 3 5 4 7 0 1))
;                  list      0(BED)  1(WC)  2(Kit)    3(Dining) 4(Study)  5(Veran)    6(Draw)    7(Guest)
(setq width_list (list (list 8 9)(list 6 8)(list 6 7)(list 8 12)(list 6 7)(list 12 13)(list 8 9)(list 8 9)))
(setq height_list (list (list 6 7)(list 6 6)(list 4 5)(list 6 6)(list 4 7)(list 8 9)(list 6 7)(list 6 7)))
(setq total_area 510) ;510 of them + some extra space
(setq width_dif (list  1 1 1 1  1 1  1 1 ))
(setq height_dif(list  1 1 1 1  1 1  1 1 ))
(defun numberofchromosomes ( numberC / i output)
	(setq i 0
	      output nil)
  	(while(< i numberC)
	  (setq group (random_gen))
	  ;(princ "\n")(princ group)
	  (setq output (append output (list group)))
	  (setq i (+ i 1))
	  ;(princ "\n")(princ (nth 0 group))
	  )
        
  	(setq output output)
       
  output
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
(defun random_gen (/ group gw1 gw2 gw3 gw4 gh1 gh2 gh3 gh4)
    (setq gw1 nil
	  gw2 nil
	  gw3 nil
	  gw4 nil
	  gh1 nil
	  gh2 nil
	  gh3 nil
	  gh4 nil
	 
    )
    (setq group nil)
    
   

      (setq l 0)
      (while (< l (length group_g1))
	   (setq mg 0)
	   (setq mg (nth l group_g1))
	  (setq dim_w (* (rnd) (nth mg width_dif)))
          (setq dim_h (* (rnd) (nth mg height_dif)))
	  
					;(princ selected)
					;(princ)
					;(princ number)
					;(princ group_number)
					;(princ)
	  
	    (if (< l 2)
	      (progn
	     (setq n (nth mg width_list)) 
	     (setq gw1 (append gw1 (list (+ dim_w (nth 0 n )))))
	    )
	     )
	     (if (and (< l 4)(> l 1))
	       (progn
	       (setq n (nth mg width_list))
	     (setq gw2 (append gw2 (list (+ dim_w (nth 0 n )))))
	    ))
	     (if (and (< l 6)(> l 3))
	       (progn
	       (setq n (nth mg width_list))
	     (setq gw3 (append gw3 (list (+ dim_w (nth 0 n )))))
	    ))
	    (if(and (< l 8)(> l 5))
	      (progn
	      (setq n (nth mg width_list))
	     (setq gw4 (append gw4 (list (+ dim_w (nth 0 n )))))
	    ))
	    
	  

	    (if (< l 2)
	    (progn (setq n (nth mg height_list)) ;(princ (nth 1 n ))
	     (setq gh1 (append gh1 (list (+ dim_h (nth 0 n )))))
	    ))
	     (if (and (< l 4)(> l 1))
	      (progn (setq n (nth mg height_list))
	     (setq gh2 (append gh2 (list (+ dim_h (nth 0 n )))))
	    ))
	     (if (and (< l 6)(> l 3))
	      (progn (setq n (nth mg height_list))
	     (setq gh3 (append gh3 (list (+ dim_h (nth 0 n )))))
	    ))
	    (if (and (< l 8)(> l 5))
	     (progn (setq n (nth mg height_list))
	     (setq gh4 (append gh4 (list (+ dim_h (nth 0 n )))))
	    ))
	    
	  
	(setq l (+ l 1))
	)
	
      
    
   
   ; (setq input nil)
    (setq group (append group(list  group_g (list gw1 gw2 gw3 gw4) (list gh1 gh2 gh3 gh4))))
  
   ; (setq input (append input (list (nth 0 (nth 1 group)) (nth 1 (nth 1 group)) (nth 2 (nth 1 group)) (nth 3 (nth 1 group))  (nth 0 (nth 2 group))(nth 1 (nth 2 group))(nth 2 (nth 2 group))(nth 3 (nth 2 group)))))

   ; (princ "\n") (princ group)

  )