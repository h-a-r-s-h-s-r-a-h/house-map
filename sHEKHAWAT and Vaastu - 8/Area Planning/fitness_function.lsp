
(defun fitness_function(input1 / fitness)

  
  (setq h 16.0
	w 32.0
	fitness 0.0
	height nil
	width  nil
	area_bay 0.0
	final_area 0.0
	bh 0.0
	hi 0.0
  )
  (setq j 0)
  (setq i 0)
  (setq n nil)
   (setq wj 0)

(setq ginc 0)
(setq group_g1 nil)
 (setq group_g (nth 0 input1))
  ;(princ group_g)
(while (< ginc (length group_g))
  (setq gj (nth ginc group_g))
  (setq gi 0)
  (while (< gi (length gj))
     (setq group_g1(append group_g1(list (nth gi gj))))
    (setq gi (+ gi 1))
   )
  (setq ginc (+ ginc 1))
  )

  ;(princ input1)
  (setq input nil)
  (setq input (append input (list (nth 0 (nth 1 input1)) (nth 1 (nth 1 input1)) (nth 2 (nth 1 input1))(nth 3 (nth 1 input1))(nth 0 (nth 2 input1))(nth 1 (nth 2 input1))(nth 2 (nth 2 input1))(nth 3 (nth 2 input1)))))
  (while (< i (length input))
      (setq n (nth i input))
   (if (< i 4)
    (progn
      (setq j 0)
    (while (< j 2)
      (setq memb (nth j n))
        (setq width (append width(list memb)))
         (setq j (+ j 1))
      )
    )
    (progn
      (setq j 0)
      (while (< j 2)
	(setq memb (nth j n))
        (setq height (append height(list memb)))
        (setq j (+ j 1))
      )
      )
    )
     (setq i (+ i 1))
    )
;(princ "fitness")
  

  
  ;(setq width (mapcar '(lambda (x) (* x 1000)) width))
  ;(setq height (mapcar '(lambda (x) (* x 1000)) height))
  ;(princ "\n")
;(princ width)
  
 ;(princ height)(princ "\n")
  (setq j 0)
  (setq ni 0)
  (setq k 0)
  (setq bays nil)
  (setq maxbaywidths nil)
  (setq hgtgap nil)
  (setq hgtspace nil)
  (while (< j 8)
        
       
       (setq hs 0.0)
     (setq tembaylist nil)
    (setq hgttospace nil)
     (while (< hs h)
                (setq bh hs)
                (setq hi (nth j height)) ;(princ j) (princ "\n")
        (setq tembaylist(append tembaylist (list (nth j group_g1))))
	        (setq hs (+ hs hi))
               (if (< hs h) 
                (setq j (+ j 1))
                 (setq bh (- hs hi))
		 )
                (if (> hs h)
		  (setq tembaylist(vl-remove (last tembaylist)tembaylist))
		  )
                (if (= j 8)
		  (progn 
                    (setq bh hs)
		    (setq hs h)
		  
		    )
		  )
      ; (if (= (rem (length hgtspace) 2) 0)
       ;            (setq hgttospace (append hgttospace(list bh)))
	;	   (setq hgttospace (append hgttospace(list (- h bh))))
	;	      )
	    )
    (setq bays (append bays (list tembaylist)))
    (setq hgtgap(append hgtgap(list (- h bh))))
    ;(princ bays)
    (if (>= hs h)
      (progn
	     
	    
	     
	       (setq ws 0.0)
	         (while (> j ni)
		  
	           
		   (if (< ws (nth ni width))
			   (setq ws (nth ni width))
		               

                    )
		    ; (princ ni) (princ "\n")
		   (setq ni (+ ni 1))
		   
		   )

	       ; (princ ws)
	)
      )
     (setq maxbaywidths (append maxbaywidths (list ws)))  
	      ; (setq area_bay (* ws bh)); (princ area_bay)
	      ;(setq final_area (+ final_area area_bay))
    ;(if (= j 15)
     ; (setq j 17)
      ;)-
   ; (setq j (- j 1))
    )
   
  ;(princ "hello")
 ; (princ bays)
  ;(princ "\n")(princ group_g)(kk k)
  (setq i 0)
  (setq elem 0)(setq lis nil)
  (while (< i (length group_g))  ;finding the misplaced entities in the layout using the term elem
    (setq j 0)
    (while (< j (length bays))
           (setq check 0)
          (if (and (= (rem i 2) 0)(= (rem j 2) 1))
	           (progn
		         (if (and(or (= (nth 0 (nth i group_g))(nth 0 (nth j bays)))(= (nth 1 (nth i group_g))(nth 1 (nth j bays)))) (setq check 0))
			   (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			      (setq check 1)
			   )
			   )
		     
		    
		     )
	    )
      (if (and (= (rem i 2) 0)(= (rem j 2) 0))
	           
		        
		     (progn
		         (if (and(or (= (nth 0 (nth i group_g))(nth 1 (nth j bays)))(= (nth 1 (nth i group_g))(nth 0 (nth j bays)))) (setq check 0))
			   (progn
			     (setq elem (+ elem 1))
			     (setq lis (reverse (nth j bays)))
			     (setq bays (replace-n lis j bays))
			      (setq check 1)
			   )
			   )
		      
		    
		     )
	    )
      
      
      (setq j (+ j 1))
      )
    (setq i (+ i 1))
    )
 ; (setq fitness 100.0)
 ;(setq fitness (- fitness (* (/ elem 12.0) 100.0)))
  ;  fitness
  
 
 
  (setq j 0)
 ; (princ bays)(princ "\n")
  ;(princ hgtgap)
  
  (setq area_spaces nil)
  (setq centroid nil)
   (setq bayhgt nil)
    (setq baywdt nil)
    
  (setq x 0)
   (setq var 0)
  (while (< x (length bays))
    (setq y (nth x bays))
    (setq z 0)
    (setq area_s nil)
    (setq centro nil)
    (setq bayh nil)
    (setq bayw nil)
   
    (while (< z (length y))
          
            (setq area_s(append area_s(list (* (nth var width) (nth var height)))))
           (setq centro(append centro(list (list (/ (nth var width) 2) (/ (nth var height) 2)))))
            (setq bayh (append bayh(list (nth var height))))
            (setq bayw (append bayw(list (nth var width))))
            
           (setq z (+ z 1))
       (setq var (+ var 1))
     )
     (setq area_spaces(append area_spaces(list area_s)))
           (setq centroid(append centroid(list centro)))
      (setq bayhgt (append bayhgt(list bayh)))
    (setq baywdt (append baywdt(list bayw)))
    (setq x (+ x 1))

    )
  ;(princ area_spaces)
   
   ; (princ bayhgt)
    ;(princ baywdt) 
    (setq sw nil)
    (setq sp nil)
    (setq sh nil)
    (setq sww nil)
  (setq i 1)
    (setq sw  (append sw (list (nth 0 baywdt))))
   ;(princ sw)
  (setq gapincre 0)
  (while (< i (length bays))
    (setq sp (nth i bays))
    (setq sh (nth i bayhgt))
  (setq sww (nth i baywdt))
     (setq hb 0)
  
     (setq gap (nth gapincre hgtgap))
    (setq gapincre (+ gapincre 1))
    (setq nextelesum 0)
     (setq elesum 0)
    (setq newwd nil)
    (setq num 0)
          (setq num1 10000)
   (while (< hb (length sp))  ;for members of bay
     	  
      (setq hgs (nth hb sh))
      (setq wgs (nth hb sww))
    ;(princ "\n")(princ sh)
      (setq nextelesum (+ nextelesum hgs))
      (setq bayi-1 (nth (- i 1) bays))
     ; (setq bayi-1area (nth (- i 1) area_spaces))
      ;(setq bayi-1cen (nth (- i 1) area_spaces))
      (setq lengthlastbay (length bayi-1))
      (setq inc 0)
      (setq k 0)
      (setq gap1 0)
      
      (while (< inc lengthlastbay)
        
;	(setq lastele (nth (- lengthlastbay (+ num 1)) bayi-1))
	(setq laste (nth (- i 1) bayhgt))
	
	   (setq lastele (nth (- lengthlastbay (+ num 1)) laste))
           (setq elesum (+ elesum lastele))
	  
	    
	(setq num1 num)
	 (if (<  (+ elesum gap gap1) nextelesum)
	   (progn
	       (setq num (+ num 1))
	       (setq k (+ k 1))
	     )
	   (progn
	      ; (setq gap1 (- (+ elesum gap) nextelesum))
	       (setq elesum (- elesum lastele))
	     ;(if (> gap1 0)
	        (setq ext num)
	      ; (setq ext (+ num 1))
	       ;)
	     (setq cenareaxsum 0)
	     (setq cenareaysum 0)
	     (setq areasum 0)
	     (setq formaxwidth nil)
	     (setq ad 0)
	      (while (>= k 0)   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
               ;(princ "hello")  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       	       ;(setq lastarea (nth (- lengthlastbay (+ num 1)) bayi-1area));;;;;;;;;
               ;(setq lastcenx (nth 0 (nth (- lengthlastbay (+ num 1)) bayi-1cen)));;
               ;(setq lastceny (nth 1 (nth (- lengthlastbay (+ num 1)) bayi-1cen)));;
	       ;(setq cenareaxsum (+ (* lastarea lastcenx) cenareaxsum));;;;;;;;;;;;;
	       ;(setq cenareaysum (+ (* lastarea lastceny) cenareaysum));;;;;;;;;;;;;
	       ;	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		(setq dif (nth (- i 1) sw))
		(setq formaxwidth (append formaxwidth (list (nth  (- (+ (length dif) ad) (+ ext 1)) dif))))
		;(princ formaxwidth)
		;(setq areasum (+ lastarea areasum))
		(setq ad (+ ad 1))
		;(setq num (+ num 1))
		(setq k (- k 1))
		(setq inc lengthlastbay)
	
	      )
	     )
	   )
	    ; (setq cenx (/ cenareaxsum areasum))
	     ;(setq ceny (/ cenareaysum areasum))
	     
	(setq inc (+ inc 1))
	)
             (setq maxwd (apply 'max formaxwidth)) ;width of this space
             (setq wdsp (+ maxwd wgs))
	     (setq newwd (append newwd (list wdsp)))
        (setq hb (+ hb 1))
     )
     (setq sw (append sw (list newwd)))
    (setq i (+ i 1))
    ;(princ sw)(princ "\n")
  
 )
  
  ;(princ group_g1)(princ "\n")
  ;(princ bays) (princ "\n")
  ;(princ hgtgap)(princ "\n")
  ;(princ area_spaces)(princ "\n")
  ;(princ sw)
   (setq i 0)
  (setq newsw nil)
  (setq bsw nil)
  (while (< i (length sw))
    (setq bsw (nth i sw))
    (setq j 0)
    (while (< j (length bsw))
    (setq newsw (append newsw (list (nth j bsw))))
      (setq j (+ j 1))
      )
    (setq i (+ i 1))
    )
  ;(princ newsw)
  (setq maxwidth (apply 'max newsw))
  (setq final_area (* h maxwidth))
  (setq utiliz (* (/ final_area 510.0) 100.0))
  (if (> final_area 510.0)
    
     (setq fitness (- 100.0 (- utiliz 100.0)))
         
     (setq fitness utiliz)
    
   )
  (setq i 0)
  (setq sum_area 0)
  (while (< i (length area_spaces))
    (setq barea (nth i area_spaces))
    (setq j 0)
    (while (< j (length barea))
    (setq sum_area (+ sum_area (nth j barea)))
      (setq j (+ j 1))
      )
    (setq i (+ i 1))
    )
  
  (setq extra 0)
  (setq extra (- (* w h) sum_area))
  (setq percent (* (/ extra (* w h)) 100))
  (setq fitness (- fitness percent))
  
;|(setq i 0)
  (setq elem 0)
  (while (< i (length group_g))
    (setq j 0)
    (while (< j (length bays))
          (if (and (= (rem i 2) 0)(= (rem j 2) 1))
	           (progn
		         (if (or (= (nth 0 (nth i group_g))(nth 0 (nth j bays)))(= (nth 0 (nth i group_g))(nth 1 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     
		     (if (or (= (nth 1 (nth i group_g))(nth 1 (nth j bays)))(= (nth 1 (nth i group_g))(nth 0 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		      (if (or (= (nth 2 (nth i group_g))(nth 2 (nth j bays)))(= (nth 2 (nth i group_g))(nth 3 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     (if (or (= (nth 3 (nth i group_g))(nth 3 (nth j bays)))(= (nth 3 (nth i group_g))(nth 2 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     )
	    )
      (if (and (= (rem i 2) 0)(= (rem j 2) 0))
	           (progn
		         (if (or (= (nth 2 (nth i group_g))(nth 0 (nth j bays)))(= (nth 2 (nth i group_g))(nth 1 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     (if (or (= (nth 3 (nth i group_g))(nth 1 (nth j bays)))(= (nth 3 (nth i group_g))(nth 0 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		      (if (or (= (nth 0 (nth i group_g))(nth 2 (nth j bays)))(= (nth 0 (nth i group_g))(nth 3 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     
		     (if (or (= (nth 1 (nth i group_g))(nth 3 (nth j bays)))(= (nth 1 (nth i group_g))(nth 2 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     )
	    )
      (if (and (= (rem i 2) 1)(= (rem j 2) 0))
	           (progn
		         (if (or  (= (nth 0 (nth i group_g))(nth 0 (nth j bays)))(= (nth 0 (nth i group_g))(nth 1 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     (if (or(= (nth 1 (nth i group_g))(nth 1 (nth j bays)))(= (nth 1 (nth i group_g))(nth 0 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		      (if (or (= (nth 2 (nth i group_g))(nth 2 (nth j bays)))(= (nth 2 (nth i group_g))(nth 3 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     (if (or (= (nth 3 (nth i group_g))(nth 3 (nth j bays)))(= (nth 3 (nth i group_g))(nth 2 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     )
	    )
      (if (and (= (rem  i 2) 1)(= (rem j 2) 1))
	           (progn
		         (if (or (= (nth 2 (nth i group_g))(nth 0 (nth j bays)))(= (nth 2 (nth i group_g))(nth 1 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     (if (or (= (nth 3 (nth i group_g))(nth 1 (nth j bays)))(= (nth 3 (nth i group_g))(nth 0 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     
	            (if (or  (= (nth 0 (nth i group_g))(nth 2 (nth j bays)))(= (nth 0 (nth i group_g))(nth 3 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
		     (if (or(= (nth 1 (nth i group_g))(nth 3 (nth j bays)))(= (nth 1 (nth i group_g))(nth 2 (nth j bays))))
			      (setq elem (+ elem 1))
			   )
	)
	    )
      (setq j (+ j 1))
      )
    (setq i (+ i 1))
    )|;
 ;(princ elem)
  (setq fitness (+ fitness (*  (/ (- 8 elem) 8.0) 100.0)))
 ;(princ "\n")(princ fitness)		         
  
  fitness
  )
(defun replace-n (new n lst / )
  (mapcar '(lambda (a) (if (= (setq n (1- n)) -1) new a)) lst)
  )


