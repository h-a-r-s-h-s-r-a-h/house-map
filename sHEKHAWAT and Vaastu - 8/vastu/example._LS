(setq room0 (list '("area" . 144) '("name" . "Room 0") '("dims" . (12 12))))

(setq room1 (list '("area" . 180) '("name" . "BedRoom 1") '("dims" . (12 15))))

(setq room2 (list '("area" . 20) '("name" . "letr") '("dims" . (4 5))))

(setq room3 (list '("area" . 24) '("name" . "Bathroom1") '("dims" . (4 6))))

(setq room4 (list '("area" . 40) '("name" . "Kitchen") '("dims" . (5 8))))

(setq room5 (list '("area" . 100) '("name" . "DiningRoom") '("dims" . (10 10))))

(defun totalarea_g4 (group  / di )
  (setq totalAr 0)
  (foreach space group
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))		 
  ; (princ space_name)
  (setq area (cdr (assoc "area" (eval (read space_name)))))
  (setq totalAr (+ totalAr area))
    )
   (setq dimsn nil)
   (setq dim nil)
   (foreach space group
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))		 
 
  (setq dim (cdr (assoc "dims" (eval (read space_name)))))
  (setq dimsn(append dimsn(list dim)))
    )
 
  (setq len nil)
  (setq hgt nil)
  
    
    
    
  ;(princ len)
   (setq dimsn (vl-sort dimsn '(lambda (e1 e2) (> (cadr e1) (cadr e2)))))
   (setq h1  (nth 1 (nth 0 dimsn)))
   (setq h2  (nth 1 (nth 1 dimsn)))
   
                (setq w1  (nth 0 (nth 0 dimsn)))
                (setq w2  (nth 0 (nth 1 dimsn)))
                ;(setq w3  (nth 0 (nth 2 dimsn)))
      (setq mw (max w1 w2))  
     ;(setq dimsn (vl-sort dimsn '(lambda (e1 e2) (< (car e1) (car e2)))))
    
     (setq w3  (nth 0 (nth 2 dimsn)))
     (setq w4  (nth 0 (nth 3 dimsn)))
     (setq mw2 (max w3 w4))
  (setq area 0)
  (setq area (* (+ h1 h2) (+ mw mw2)))
  (setq di nil)
  (setq di(append di(list (+ h1 h2) (+ mw mw2) dimsn)))
  
  )
(defun totalarea_g3 (group  / di )
  (setq totalAr 0)
  (foreach space group
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))		 
  ; (princ space_name)
  (setq area (cdr (assoc "area" (eval (read space_name)))))
  (setq totalAr (+ totalAr area))
    )
   (setq dimsn nil)
   (setq dim nil)
   (foreach space group
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))		 
 
  (setq dim (cdr (assoc "dims" (eval (read space_name)))))
  (setq dimsn(append dimsn(list dim)))
    )
 
  (setq len nil)
  (setq hgt nil)
  
    
    
    
  ;(princ len)
   (setq dimsn (vl-sort dimsn '(lambda (e1 e2) (> (cadr e1) (cadr e2)))))
   (setq h1  (nth 1 (nth 0 dimsn)))
   (setq h2  (nth 1 (nth 1 dimsn)))
   
                (setq w1  (nth 0 (nth 0 dimsn)))
                (setq w2  (nth 0 (nth 1 dimsn)))
                ;(setq w3  (nth 0 (nth 2 dimsn)))
      (setq mw (max w1 w2))  
     ;(setq dimsn (vl-sort dimsn '(lambda (e1 e2) (< (car e1) (car e2)))))
    
     (setq w3  (nth 0 (nth 2 dimsn)))
     ;(setq w4  (nth 0 (nth 3 dimsn)))
     ;(setq mw2 (max w3 w4))
  (setq area 0)
  (setq area (* (+ h1 h2) (+ mw w3)))
  (setq di nil)
  (setq di(append di(list (+ h1 h2) (+ mw w3) dimsn)))
  
  )
(defun totalarea_g2 (group  / di )
  (setq totalAr 0)
  (foreach space group
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))		 
  ; (princ space_name)
  (setq area (cdr (assoc "area" (eval (read space_name)))))
  (setq totalAr (+ totalAr area))
    )
   (setq dimsn nil)
   (setq dim nil)
   (foreach space group
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))		 
 
  (setq dim (cdr (assoc "dims" (eval (read space_name)))))
  (setq dimsn(append dimsn(list dim)))
    )
 
  (setq len nil)
  (setq hgt nil)
  
    
    
    
  ;(princ len)
   (setq dimsn (vl-sort dimsn '(lambda (e1 e2) (> (cadr e1) (cadr e2)))))
   (setq h1  (nth 1 (nth 0 dimsn)))
  ; (setq h2  (nth 1 (nth 2 dimsn)))
   
                (setq w1  (nth 0 (nth 0 dimsn)))
                (setq w2  (nth 0 (nth 1 dimsn)))
                ;(setq w3  (nth 0 (nth 2 dimsn)))
      ;(setq mw (max w1 w2))  
     ;(setq dimsn (vl-sort dimsn '(lambda (e1 e2) (< (car e1) (car e2)))))
    
     ;(setq w3  (nth 0 (nth 1 dimsn)))
     ;(setq w4  (nth 0 (nth 3 dimsn)))
     ;(setq mw2 (max w3 w4))
  (setq area 0)
  (setq area (* h1 (+ w1 w2)))
  (setq di nil)
  (setq di(append di(list h1 (+ w1 w2) dimsn)))
  
  )
;(setq lis nil)
 ;     (setq lis (append lis(list (list 0 0))))
(defun drawrect( group arg xii yii / output_p)
  ;(setq old_osmode (getvar "osmode"))
   ;(setvar "osmode" 0)
   (setvar "cmdecho" 0)
   
   (command "._-layer" "_m" "Space" "_c" 10 "" "")
    ;(setq arg (totalarea_g4 '(0 1 2 3)))
  ;(princ "problem")
     (setq rlen 0)
     (setq rhgt 0)
     (setq di nil)
     (setq rlen (+ (nth 1 arg) yii))
     (setq rhgt (+ (nth 0 arg) xii))
 
  (setq di (nth 2 arg))
  (setq output_p nil)
     ;(setq group '(0 1 2 3))
     (setq newarea (* rhgt rlen))
     (setq lis nil)
      (setq lis (append lis(list (list xii yii))))
  
    ; (princ (length lis))
     (setq terminate 0)
     (setq max_len 0)
     (setq max_hgt 0)
   (princ "problem")
  (setq ind 0)
          (foreach space group
	      
                (setq j 0)
	       ; (setq pt1 0)
	        ;(setq pt2 0)
	        ;(setq pt3 0)
	        ;(setq pt4 0)
	    (setq space_x 0)
             (setq space_y 0) 
	        ;(setq k (length lis))
	      (while (<  j  (length lis))
                
		(setq setx (nth 0 (nth j lis)))
		(setq sety (nth 1 (nth j lis)))
		(setq space_x setx)
		    (setq space_y sety)
                    (setq space_len (nth 0 (nth space di)))
		    (setq space_hgt (nth 1 (nth space di)))
		    (setq m 0) 
		(if (and (<= (+ space_x space_len ) rlen) (<= (+ space_y space_hgt ) rhgt))              ;last and first case 
                   (progn  
		        (setq m (+ j 1))    
			(while (< m (length lis))
				  (setq xi (nth 0 (nth m lis)))
		                  (setq yi (nth 1 (nth m lis)))
			   (if (and (< space_x xi)  (< space_y yi))
                             (progn
			      (if (and (<= (+ space_x space_len) xi) (<= (+ space_y space_hgt) yi))
				        (progn   
					 (setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
		                          (setq pt1 (list space_x space_y))
		                          (setq pt2 (list (+ space_x space_len) space_y))
	                                  (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                  (setq pt4 (list space_x (+ space_y space_hgt)))
                                          (setq output_p (append output_p (list pt1 pt2 pt3 pt4)))  (princ "hellooooooooooo")
					  (if (> (+ space_x space_len) max_len)                         ; cal max height and  max width
					       (setq max_len (+ space_x space_len))
					    )
					  (if (> (+ space_y space_hgt) max_hgt)
					       (setq max_hgt (+ space_y space_hgt))
					    )


					  
					  (setq temp_lis nil)
					  (foreach ele_lis lis                                         ;remove last point from lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					    (setq lis temp_lis)
					   (setq temp_lis nil)
					   (foreach ele_lis lis                                                ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (< b (+ space_y space_hgt)))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
					  (setq temp_lis nil)
					   (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a (+ space_x space_len)) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
					  	      (command "._pline" pt1 pt2 pt3 pt4 "_c")

  
                                                       (setq space_string (vl-princ-to-string space))
                                                         (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

                                                        (setq name (cdr (assoc "name" (eval (read space_name)))))
 

                                                            (command "-MTEXT" pt1 pt4 name "") 
		                         (setq lis (cons (list space_x (+ space_y space_hgt)) lis))
					  (setq lis (cons (list (+ space_x space_len) space_y) lis))
					  
                                          (setq lis (vl-sort lis '(lambda (e1 e2) (< (cadr e1) (cadr e2)))))
                                          (setq lis (vl-sort lis '(lambda (e1 e2) (< (car e1) (car e2)))))
                                          ;(vl-remove '(space_x space_y) lis)
					  (setq j (length lis))
					  (setq m (length lis))
					  
		                        )
				        (progn
				           (if (and (<= (+ space_x space_len) xi) (> (+ space_y space_hgt) yi))
					      (progn   (setq p 0)
						       (foreach membr lis
							    (if (and (< (nth 0 lis) xi) (> (nth 1 lis) yi))
						             (progn (setq p 1)
							      )
							     )
							 )
							    
							 (if (= p 0)
								       (progn
					(setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
		                                                         (setq pt1 (list space_x space_y)) (princ p1)
		                                                         (setq pt2 (list (+ space_x space_len) space_y))
	                                                                 (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                                                 (setq pt4 (list space_x (+ space_y space_hgt)))
									 (setq output_p (append output_p(list pt1 pt2 pt3 pt4))) ;(princ output_p)
					(if (> (+ space_x space_len) max_len)
					       (setq max_len (+ space_x space_len))
					    )
					  (if (> (+ space_y space_hgt) max_hgt)
					       (setq max_hgt (+ space_y space_hgt))
					    )
					 (setq temp_lis nil)
					  (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
				          
					  (setq lis temp_lis)
					  (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (< b (+ space_y space_hgt)))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
					  (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a (+ space_x space_len)) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
									  (command "._pline" pt1 pt2 pt3 pt4 "_c")

  
                                                       (setq space_string (vl-princ-to-string space))
                                                         (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

                                                        (setq name (cdr (assoc "name" (eval (read space_name)))))
 

                                                            (command "-MTEXT" pt1 pt4 name "")        
		                                                         (setq lis (cons  (list space_x (+ space_y space_hgt)) lis))
					                                  (setq lis (cons (list (+ space_x space_len) space_y) lis))
                                                                         (setq  lis (vl-sort lis '(lambda (e1 e2) (< (cadr e1) (cadr e2)))))
                                                                         (setq lis (vl-sort lis '(lambda (e1 e2) (< (car e1) (car e2)))))
                                                                        ; (vl-remove '(space_x space_y) lis)
									 (setq j (length lis))
									 (setq m (length lis))
		                                                        )
						                     )
								)
							      )
							 				     
					  
				       (progn
				           (if (and (> (+ space_x space_len) xi) (<= (+ space_y space_hgt) yi))
					      (progn   (setq p 0)
						       (foreach membr lis
							    (if (and (> (nth 0 lis) xi) (< (nth 1 lis) yi))
						             (progn (setq p 1)
							      )
							     )
							 )
							(if (= p 0)
								       (progn
				(setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
		                                                         (setq pt1 (list space_x space_y)) (princ p1)
		                                                         (setq pt2 (list (+ space_x space_len) space_y))
	                                                                 (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                                                 (setq pt4 (list space_x (+ space_y space_hgt)))
									 (setq output_p (append output_p(list pt1 pt2 pt3 pt4)))
									   (if (> (+ space_x space_len) max_len)
					       (setq max_len (+ space_x space_len))
					    )
					  (if (> (+ space_y space_hgt) max_hgt)
					       (setq max_hgt (+ space_y space_hgt))
					    )
									  (setq temp_lis nil)
					  (foreach ele_lis lis
                                                       (setq a (nth 0 ele_lis ))
                                                       (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					)
					(setq lis temp_lis)
					 (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (< b (+ space_y space_hgt)))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
					  (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a (+ space_x space_len)) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
									  (command "._pline" pt1 pt2 pt3 pt4 "_c")

  
                                                       (setq space_string (vl-princ-to-string space))
                                                         (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

                                                        (setq name (cdr (assoc "name" (eval (read space_name)))))
 

                                                            (command "-MTEXT" pt1 pt4 name "")     
		                                                        (setq lis (cons (list space_x (+ space_y space_hgt)) lis))
					                                (setq lis (cons (list (+ space_x space_len) space_y) lis))
                                                                         (setq  lis (vl-sort lis '(lambda (e1 e2) (< (cadr e1) (cadr e2)))))
                                                                         (setq lis (vl-sort lis '(lambda (e1 e2) (< (car e1) (car e2)))))
                                                                        ; (vl-remove '(space_x space_y) lis)
									 (setq j (length lis))
									 (setq m (length lis))
		                                                        )
						                     )
								)
							      )
							 )
					  )
						   
					       
					    
                                                     
				             
			         	)				     
			             )
	                   
		                 )
	                     (setq m (+ m 1))
	                     )
	                                                                (setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
		                                                         (setq pt1 (list space_x space_y))
		                                                         (setq pt2 (list (+ space_x space_len) space_y))
	                                                                 (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                                                 (setq pt4 (list space_x (+ space_y space_hgt)))
		                                               (setq output_p (append output_p(list pt1 pt2 pt3 pt4))) 
		       (if (> (+ space_x space_len) max_len)
					       (setq max_len (+ space_x space_len))
					    )
					  (if (> (+ space_y space_hgt) max_hgt)
					       (setq max_hgt (+ space_y space_hgt))
					    )
			       (setq temp_lis nil)
					  (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                    (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
		                (setq lis temp_lis)
		                 (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (< b (+ space_y space_hgt)))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
					  (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a (+ space_x space_len)) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
		                                                         (setq lis (cons (list space_x (+ space_y space_hgt)) lis))
					                                  (setq lis (cons (list (+ space_x space_len) space_y) lis))
                                                                         (setq  lis (vl-sort lis '(lambda (e1 e2) (< (cadr e1) (cadr e2)))))
                                                                         (setq lis (vl-sort lis '(lambda (e1 e2) (< (car e1) (car e2)))))
                                                                         ;(vl-remove '(space_x space_y) lis)
		                                                         (setq j (length lis))

		                                     ; (command "._layer" "_m" "Space" "_c" 10 "" "")

			                                (command "._pline" pt1 pt2 pt3 pt4 "_c")

  
                                                       (setq space_string (vl-princ-to-string space))
                                                         (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

                                                        (setq name (cdr (assoc "name" (eval (read space_name)))))
 

                                                            (command "-MTEXT" pt1 pt4 name "")
                                                 
                                 (setq  output_p output_p)                                      
                             )
		      (progn
(setq  output_p output_p)      
			(setq j (+ j 1))
			        (setq ind (+ ind 1))
			        
			        (if (= ind (length lis))
				  (setq terminate 1)
				  )
                            
			 )
		   
		      )
		  )
	
 ;(princ output_p)
	    )

	
 ; (setvar "osmode" old_osmode)
  
  )
(defun kya_baat(/ old_osmode r1 r2 r3 r4)
  (setq old_osmode (getvar "osmode"))
   (setvar "osmode" 0)
   (setvar "cmdecho" 0)
  (setq group '(0 1 2 3))
  (setq di nil)
  (setq group123 nil)
  (setq rect nil)
  ;(setq lis (append lis(list (list 0 0))))
  
  (setq outer 0)
  (setq lol 0)
   (setq hii 0)
    (while (< outer (length group))
      (setq h 0)
        (setq space 0)
      (setq checked nil)
      (setq group123 nil)
      (setq di (totalarea_g4 group))
  (setq checked (append checked (list 100)))
       (while (< h (length group))
	   (if (= h 0)
	       (progn
		     (setq space (nth outer group))
		     ;(drawrect space di)
		     (setq group123 (append group123(list space)))
		 (princ "h==>")
		 (princ  space)
		)
	       (progn
                      ;(setq ji (- j 1))
		      (setq k 0)
		 (princ  "\n")
		 (princ "h==>")
		       (princ h)
		 (setq checked(append checked(list space)))
		      (setq k (maxprox space group checked))
		 
		 (princ  "\n")
		 (princ "k==>")
                      (princ  k)
		 
		      ;(drawrect k di)                         ; termin will be set by drawrect when sol is not possible
                        (setq group123(append group123(list k)))
		 (setq space k)
		     ; (if (= termin 1)
                      ;    (setq j (length group))
			  ;
			;)
		
		 )
	     )
	     (setq h (+ h 1))
	     
	 )
      (setq outer (+ outer 1))
  
         (princ "hello")
          (setq rect1 (drawrect group123 di lol hii ))
        (setq prin_rect 0);(princ  rect1)
        (while (< prin_rect (length rect1))    ;*************************************************************************
	    ; (princ rect1)
	     ;(setq g1234 (nth prin_rect rect))
	   	  
         (setq r1 (nth (+ 0 prin_rect) rect1))
         (setq r2 (nth (+ 1 prin_rect) rect1))
         (setq r3 (nth (+ 2 prin_rect) rect1))
         (setq r4 (nth (+ 3 prin_rect) rect1))
         (setq prin_rect (+ prin_rect 4))
	  
       (command "._layer" "_m" "Space" "_c" 10 "" "")

			                                (command "._line" r1 r2 r3 r4 "_c")


		                                	(setq space_string (vl-princ-to-string space))
		                                       (setq space_name (strcat "ROOM" space_string))
		 
		                                       ;(setq area (cdr (assoc "area" (eval (read space_name)))))
			
		                                        (setq name (cdr (assoc "name" (eval (read space_name)))))   

		                                         (command "-MTEXT" r1 r3 name "")
	  )
      
      (setq lol (+ lol 100))
      
      
      )
	 
 (setvar "osmode" old_osmode)
  )