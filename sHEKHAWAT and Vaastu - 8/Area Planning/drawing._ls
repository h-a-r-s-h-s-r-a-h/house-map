
;(((3 5 4 10) (14 0 1 2) (7 8 9 6) (11 12 13 15)) ((6.92904 8.8919 6.88323 8.378) (7.60739 10.2046 8.47412 4.77729) (7.05895 8.52988 3.04112 11.308) (6.52331 6.80773 7.16022 10.3842)) ((4.01755 8.34592 4.3014 11.8008) (7.20648 10.1609 10.7317 5.04114) (6.81753 6.2844 4.88646 11.1002) (8.68138 7.42108 10.6957 8.36255)))
(setq room0 (list '("area" . 63) '("name" . "BedRoom ") '("dims" . (9 7))))

(setq room1 (list '("area" . 48) '("name" . "WC & Bath") '("dims" . (8 6))))

(setq room2 (list '("area" . 35) '("name" . "Kitchen") '("dims" . (7 5))))

(setq room3 (list '("area" . 72) '("name" . "DiningRoom") '("dims" . (12 6))))

(setq room4 (list '("area" . 49) '("name" . "Study") '("dims" . (7 7))))

(setq room5 (list '("area" . 117) '("name" . "Verandah") '("dims" . (13 9))))

(setq room6 (list '("area" . 63) '("name" . "Drawing") '("dims" . (9 7))))

(setq room7 (list '("area" . 63) '("name" . "Guest Room") '("dims" . (9 7))))

;(setq room4 (list '("area" . 35) '("name" . "BR1") '("dims" . (7 5))))

;(setq room5 (list '("area" . 35) '("name" . "BR2") '("dims" . (7 5))))


;(setq room7 (list '("area" . 6) '("name" . "WC2") '("dims" . (3 2))))
		  
;(setq room12 (list '("area" . 63) '("name" . "Study 2") '("dims" . (9 7))))

;(setq room13 (list '("area" . 90) '("name" . "Lib") '("dims" . (10 9))))

;(setq room14 (list '("area" . 90) '("name" . "Play Room") '("dims" . (10 9))))

;(setq room15 (list '("area" . 20) '("name" . "Ent") '("dims" . (5 4))))

(defun draw( / p1 p2 p3 p4)
  (setq old_osmode (getvar "osmode"))
   (setvar "osmode" 0)

(setq drawingchromosomes (newGA))
 ;(setq drawingchromosomes (list (list (list (list 15 3 6 12) (list 11 4 8 13) (list 14 2 5 10) (list 7 9 0 1))         
;  (list (list 4.69307 6.24451 6.70486 8.49351) (list 2.0 6.23628 9.67205 8.77626) (list 8.20383 8.32706 6.41271 6.4646) (list 3.0 8.83614 8.55853 8.53617))     
; (list (list 3.82438 8.40297 4.76154 6.45229) (list 3.0 8.58038 8.819 12.9652) (list 6.10301 9.29659 8.11219 4.66685) (list 2.0 8.47479 6.20245 6.17893)))))

;Unique Fitness Population 93
;148.751
;139.912
;max fitness_value chromosome 173.88((((15 3 4 11) (6 12 13 8) (2 14 10 5) (7 9 1 0)) ((4.69307 6.24451 6.70486 8.49351) (2.0 6.23628 9.67205 8.77626) (8.20383 8.32706 6.41271 6.4646) (3.0 8.83614 8.55853 8.53617)) ((3.82438 8.40297 4.76154 6.45229) (3.0 8.58038 8.819 12.9652) (6.10301 9.29659 8.11219 4.66685) (2.0 8.47479 6.20245 6.17893))) (((15 3 12 6) (11 4 13 8) (14 2 10 5) (9 7 0 1)) ((4.69307 8.40297 6.23628 2.0) (6.96972 6.02296 8.52474 8.16335) (9.22927 8.71558 6.44196 4.61342) (8.83614 3.0 8.53617 8.55853)) ((3.82438 6.24451 8.58038 3.0) (8.86203 4.10917 9.94499 12.5272) (8.60032 6.62277 8.35559 6.54556) (8.47479 2.0 6.17893 6.20245))) (((3 15 4 11) (12 6 13 8) (14 2 5 10) (9 7 0 1)) ((8.40297 4.69307 4.79597 8.07918) (8.58896 3.0 9.67205 8.77626) (8.06125 6.39501 6.4646 8.11219) (8.83614 3.0 8.53617 8.55853)) ((6.24451 3.82438 6.25661 6.32313) (6.09344 2.0 8.819 12.9652) (9.88638 8.57829 4.66685 6.41271) (8.47479 2.0 6.17893 6.20245))) (((3 15 4 11) (6 12 13 8) (14 2 5 10) (9 7 0 1)) ((6.24451 4.69307 6.25661 8.07918) (2.0 6.23628 9.67205 8.77626) (8.06125 6.39501 6.59581 6.15435) (8.47479 3.0 8.53617 8.55853)) ((8.40297 3.82438 4.79597 6.32313) (3.0 8.58038 8.819 12.9652) (9.88638 8.57829 4.60265 8.12799) (8.83614 2.0 6.17893 6.20245))) (((3 15 4 11) (6 12 13 8) (2 14 10 5) (7 9 1 0)) ((6.24451 4.69307 6.25661 8.07918) (2.0 8.58896 9.67205 8.77626) (6.39501 8.06125 6.15435 6.59581) (3.0 8.83614 8.55853 8.53617)) ((8.40297 3.82438 4.79597 6.32313) (3.0 6.09344 8.819 12.9652) (8.57829 9.88638 8.12799 4.60265) (2.0 8.47479 6.20245 6.17893))) (((3 15 4 11) (12 6 13 8) (14 2 7 9) (10 5 0 1)) ((8.40297 4.69307 4.79597 8.07918) (8.58896 3.0 9.67205 8.77626) (8.06125 6.39501 3.0 8.47479) (8.11219 6.4646 8.53617 8.55853)) ((6.24451 3.82438 6.25661 6.32313) (6.09344 2.0 8.819 12.9652) (9.88638 8.57829 2.0 8.83614) (6.41271 4.66685 6.17893 6.20245))) (((3 15 4 11) (12 6 13 8) (2 14 5 10) (7 9 1 0)) ((8.40297 4.69307 4.79597 8.07918) (8.58896 3.0 9.67205 8.77626) (6.39501 8.06125 4.61342 8.35559) (3.0 8.38973 8.55853 8.53617)) ((6.24451 3.82438 6.25661 6.32313) (6.09344 2.0 8.819 12.9652) (8.57829 9.88638 6.54556 6.44196) (2.0 8.01594 6.20245 6.17893))) (((3 15 4 11) (12 6 8 13) (14 2 10 5) (9 7 0 1)) ((6.24451 4.69307 6.25661 8.07918) (8.73213 3.0 8.69985 9.82098) (8.06125 6.39501 6.44196 4.61342) (8.22941 2.0 8.53617 8.55853)) ((8.40297 3.82438 4.79597 6.32313) (6.99404 2.0 12.4675 8.7472) (9.88638 8.57829 8.35559 6.54556) (8.05384 3.0 6.17893 6.20245))) (((3 15 4 11) (12 6 13 8) (2 14 5 10) (9 7 0 1)) ((6.24451 4.69307 6.25661 8.07918) (6.90756 2.0 8.819 8.77626) (6.62277 9.22927 4.61342 8.35559) (8.47479 3.0 8.53617 8.55853)) ((8.40297 3.82438 4.79597 6.32313) (8.19917 3.0 9.67205 12.9652) (8.71558 8.60032 6.54556 6.44196) (8.83614 2.0 6.17893 6.20245))) (((3 15 12 6) (4 11 13 8) (2 14 5 10) (7 9 1 0)) ((6.15041 3.05305 6.09344 3.0) (4.10917 8.86203 9.67205 8.77626) (8.20383 8.32706 6.2057 6.25543) (3.0 8.83614 8.55853 8.53617)) ((8.57975 4.15298 8.58896 2.0) (6.02296 6.96972 8.819 12.9652) (6.10301 9.29659 4.24169 8.49736) (2.0 8.47479 6.20245 6.17893))))

 ;(list (list 11.7036 6.87949 7.37841 7.98438) (list 7.39804 4.95371 5.7663 11.4737) (list 7.83063 4.78805 11.9176 9.85465) (list 4.58872 9.40085 9.91513 9.09168)) 
;(list (list 11.9779 7.86287 8.05897 8.09717) (list 8.19324 6.70504 3.65994 9.89738) (list 8.96437 6.76791 10.9053 8.89705) (list 7.94482 9.31184 11.9704 8.23561)))))
(setq fitness_population nil)
 	(foreach chromosome best_population
	  	(setq value (fitness_function chromosome))
		(setq fitness_population (append fitness_population (list value)))
		(setq sum (+ sum value))
	  )
(setq max_fitness (apply 'max fitness_population))
(princ max_fitness)
(setq index (vl-position (apply 'max fitness_population) fitness_population))
  (setq index 0)
(setq draw_i 0)
(setq interval 0)
(while (< draw_i (length drawingchromosomes))
(setq max_fitness_chromo (nth draw_i drawingchromosomes))
(princ max_fitness_chromo)
;(setq max_fitness_chromo (list (list (list 3 5 4 10) (list 14 0 1 2) (list 7 8 9 6) (list 11 12 13 15)) (list (list 6.92904 8.8919 6.88323 8.378) (list 7.60739 10.2046 8.47412 4.77729) (list 7.05895 8.52988 3.04112 11.308) (list 6.52331 6.80773 7.16022 10.3842)) (list (list 4.01755 8.34592 4.3014 11.8008) (list 7.20648 10.1609 10.7317 5.04114) (list 6.81753 6.2844 4.88646 11.1002) (list 8.68138 7.42108 10.6957 8.36255))))
; fitness= 99.80 (((0 1 14 2) (5 4 10 3) (7 8 9 6) (15 11 13 12)) ((11.1528 8.09909 7.48023 4.41805) (9.62104 4.23935 8.09946 4.46876) (6.25767 6.23674 3.54719 11.0324) (10.6924 7.34244 7.21004 6.65913)) ((9.07241 11.1727 8.35275 6.43183) (8.9255 6.51239 10.0454 5.77851) (7.80252 8.87457 5.49021 11.4691) (8.09586 8.66938 10.7977 8.62769)))
(setq h 17.0
	w 29.0
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
 (setq group_g (nth 0 max_fitness_chromo))
(while (< ginc (length group_g))
  (setq gj (nth ginc group_g))
  (setq gi 0)
  (while (< gi (length gj))
     (setq group_g1(append group_g1(list (nth gi gj))))
    (setq gi (+ gi 1))
   )
  (setq ginc (+ ginc 1))
  )



  (setq input nil)
  (setq input (append input (list (nth 0 (nth 1 max_fitness_chromo)) (nth 1 (nth 1 max_fitness_chromo)) (nth 2 (nth 1 max_fitness_chromo)) (nth 3 (nth 1 max_fitness_chromo))  (nth 0 (nth 2 max_fitness_chromo))(nth 1 (nth 2 max_fitness_chromo))(nth 2 (nth 2 max_fitness_chromo))(nth 3 (nth 2 max_fitness_chromo)))))
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
    (setq vr 0)
  (setq k 0)
  (setq wdf nil)
  (setq htf nil)
  (while (< k (length group_g1))
  (foreach el group_g1
       (setq pos (vl-position el group_g1))
          (if (= el vr)
               (progn
		 (setq wdf(append wdf(list (nth pos width))))

                 (setq htf(append htf(list (nth pos height))))
		 (setq vr (+ vr 1))
		 )
	    )
	  )
	(setq k (+  k 1))
  )
;(setq width (mapcar '(lambda (x) (* x 1000)) width))
  ;(setq height (mapcar '(lambda (x) (* x 1000)) height))
(princ width) (princ "\n")
 (princ height)(princ "\n")
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
      ;)
   ; (setq j (- j 1))
    )
   ;(princ bays)
  ;(princ "\n")(princ group_g)
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
  (setq ginc 0)
  (setq group_g1 nil)
  (while (< ginc (length bays))
  (setq gj (nth ginc bays))
  (setq gi 0)
  (while (< gi (length gj))
     (setq group_g1(append group_g1(list (nth gi gj))))
    (setq gi (+ gi 1))
   )
  (setq ginc (+ ginc 1))
  )
  (setq width nil)
  (setq height nil)
  (setq group_g nil)
  (setq itr 0)
  
  (foreach em group_g1
     (setq width(append width (list (nth em wdf))))
     (setq height(append height (list (nth em htf))))
     (while (< itr 4)
             (setq group_g(append group_g(list em)))
              (setq itr (+ itr 1))
    )
    )

  (setq j 0)
  (princ bays)(princ "\n")
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
	      (while (>= k 0)   
		(setq dif (nth (- i 1) sw))
		(setq formaxwidth (append formaxwidth (list (nth  (- (+ (length dif) ad) (+ ext 1)) dif))))
		
		(setq ad (+ ad 1))
		;(setq num (+ num 1))
		(setq k (- k 1))
		(setq inc lengthlastbay)
	
	      )
	     )
	   )
	    
	     
	(setq inc (+ inc 1))
	)
             (setq maxwd (apply 'max formaxwidth)) ;width of this space
             (setq wdsp (+ maxwd wgs))
	     (setq newwd (append newwd (list wdsp)))
        (setq hb (+ hb 1))
     )
     (setq sw (append sw (list newwd)))
;(princ sw)
    (setq i (+ i 1))
    
  
 )
      (princ "\n")(princ sw)
  ;******************************************
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
 
  (setq maxwidth (apply 'max newsw)) (princ maxwidth)
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
  (princ "LArea")(princ sum_area)
  (setq extra 0)
  (setq extra (- (* w h) sum_area))
  (princ extra)
  (setq percent (* (/ extra (* w h)) 100))
  (setq fitness (- fitness percent))
   (setq fitness (+ fitness (*  (/ (- 8 elem) 8.0) 100.0)))
 (princ "\n")(princ bays)(princ fitness)		         
  (princ "\n")(princ width)
  (princ "\n")(princ height)
  ;*********************************
  
   (setvar "cmdecho" 0)
   
   (command "._-layer" "_m" "Space" "_c" 10 "" "")
  (setq points nil)
 
  (setq pt1 0)
	        (setq pt2 0)
	        (setq pt3 0)
	        (setq pt4 0)
  (setq i 0)
  (setq common 0)
  (while (< i (length bays))
    (setq bay 0)
    (setq bay (nth i bays))
    (if(= i 0)
      (progn
      (setq j 0)
       (setq space_x (+ 0 interval))
       (setq space_y 0)
      (while (< j (length bay))
                                 	(setvar "cmdecho" 0)
   
                                       (command "._-layer" "_m" "Space" "_c" 10 "" "")
	                              (setq space_len (nth common width))
	                              (setq space_hgt (nth common height))
	                                  (setq pt1 (list space_x space_y)) 
		                          (setq pt2 (list (+ space_x space_len) space_y))
	                                  (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                  (setq pt4 (list space_x (+ space_y space_hgt)))
	                        (setq points(append points(list pt1 pt2 pt3 pt4)))
                            (setq common (+ common 1))
	(setq j (+ j 1))
	(setq space_x (+ 0 interval))
	(setq space_y (+ space_y space_hgt))
	)
      (setq i (+ i 1))
      )
   (progn
         (if (= (rem i 2) 1)
	   (progn
	     (setq bay (nth i bays))
	    
	     (setq j 0)
            (while (< j (length bay))
	                               (if (= j 0)
					 (progn
	                                (setq space_x (+ (nth j (nth i sw)) interval))
                                        (setq space_y h)
					)
					 (progn
					   	(setq space_x (+ (nth j (nth i sw)) interval))
	                                        (setq space_y (- space_y space_hgt))
					   )
					 )
	                                (setvar "cmdecho" 0)
   
                                       (command "._-layer" "_m" "Space" "_c" 10 "" "")
	                              (setq space_len (nth common width))
	                              (setq space_hgt (nth common height))
	                                  (setq pt3 (list space_x space_y)) 
		                          (setq pt4 (list (- space_x space_len) space_y))
	                                  (setq pt1 (list (- space_x space_len) (- space_y space_hgt)))
	                                  (setq pt2 (list space_x (- space_y space_hgt)))
	                         (setq points(append points(list pt1 pt2 pt3 pt4)))
         (setq common (+ common 1))
         (setq j (+ j 1))

	
	 )
          (setq i (+ i 1))
       )
    )
   (if (= (rem i 2) 0)
       (progn
	 (setq bay (nth i bays))
	     
	     (setq j 0)
            (while (< j (length bay))
	                               (if (= j 0)
					 (progn
	                                (setq space_x (+ (nth j (nth i sw)) interval))
                                        (setq space_y 0)
					)
					 (progn
					   	(setq space_x (+ (nth j (nth i sw)) interval))
      	                                        
                                            	(setq space_y (+ space_y space_hgt))
					   )
					 )
	                               (setvar "cmdecho" 0)
   
                                       (command "._-layer" "_m" "Space" "_c" 10 "" "")
	                              (setq space_len (nth common width))
	                              (setq space_hgt (nth common height))
	                                  (setq pt2 (list space_x space_y)) 
		                          (setq pt1 (list (- space_x space_len) space_y))
	                                  (setq pt4 (list (- space_x space_len) (+ space_y space_hgt)))
	                                  (setq pt3 (list space_x (+ space_y space_hgt)))
	                         (setq points(append points(list pt1 pt2 pt3 pt4)))
         (setq common (+ common 1))
         (setq j (+ j 1))

	
	)
     (setq i (+ i 1))
    )
   )
  )
  )
 ); while close
  (setq j 0)
  (setq i 0)
    (setq p1 0)
    (setq p2 0)
    (setq p3 0)
    (setq p4 0)
  (while (< j (length points))

    (setq space (nth i group_g1))
    (setq p1 (nth j points))
    (setq p2 (nth (+ j 1) points))
    (setq p3 (nth (+ j 2) points))
    (setq p4 (nth (+ j 3) points))
            (setvar "cmdecho" 0)
   
            (command "._-layer" "_m" "Space" "_c" 10 "" "")
            (command "._pline" p1 p2 p3 p4 "_c")
	    (setq space_string (vl-princ-to-string space))
            (setq space_name (strcat "ROOM" space_string))
		 
  

            (setq name (cdr (assoc "name" (eval (read space_name)))))
 

            (command "text" p1 1.000 0 name)
    (setq i (+ i 1))
    (setq j (+ j 4))
    )
  ;(draw)
  
  
  
  (setq interval (+ interval 100))
  (setq draw_i (+ draw_i 1))
  )
  (setvar "osmode" old_osmode)
  )
(defun replace-n (new n lst / )
  (mapcar '(lambda (a) (if (= (setq n (1- n)) -1) new a)) lst)
  )