(setq room0 (list '("area" . 144) '("name" . "Room 0") '("dims" . (10 10))))

(setq room1 (list '("area" . 180) '("name" . "BedRoom 1") '("dims" . (10 10))))

(setq room2 (list '("area" . 20) '("name" . "Kitchen") '("dims" . (5 8))))

(setq room3 (list '("area" . 24) '("name" . "Dining Room") '("dims" . (10 10))))

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
  (setq di(append di(list (+ h1 h2 5) (+ mw mw2 30) dimsn)))
  
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
(defun drawrect(  / p1 p2 p3 p4)
  (setq old_osmode (getvar "osmode"))
   (setvar "osmode" 0)
   (setvar "cmdecho" 0)
   
   (command "._-layer" "_m" "Space" "_c" 10 "" "")
  
   
  (setq xii 0)
  (setq yii 0)
  (setq group '(0 1 2 3))
  (setq ind 0)
  ;(while (<())
  (setq mii 0)
  (setq iii 0)
    (while (< mii (length group))
      (setq h11 0)
        (setq space11 0)
       (setq arg (totalarea_g4 '(0 1 2 3)))
  
     (setq rlen 0)
     (setq rhgt 0)
     (setq di nil)
     (setq rlen (+ (nth 1 arg) xii))
     (setq rhgt (+ (nth 0 arg) yii))
     (setq di (nth 2 arg))
     ;(princ di)
     (setq newarea (* rhgt rlen))
     (setq lis nil)
      (setq lis (append lis(list (list xii yii))))
      (setq lis (append lis(list (list rlen rhgt))))
     ;(princ (length lis))
     (setq terminate 0)
     (setq max_len 0)
     (setq max_hgt 0)
     ; (setq di (totalarea_g4 group))
      (setq checked nil)
      (setq group123 nil)
  (setq checked (append checked (list 100)))
       (while (< h11 (length group))
	   (if (= h11 0)
	       (progn
		     (setq space11 (nth mii group))
		     ;(drawrect space di)
		     (setq group123 (append group123(list space11)))
		 (princ "h==>")
		 (princ  space11)
		)
	       (progn
                      ;(setq ji (- j 1))
		      (setq k 0)
		 (princ  "\n")
		 (princ "h==>")
		       (princ h11)
		 (setq checked(append checked(list space11)))
		      (setq k (maxprox space11 group checked))
		 
		 (princ  "\n")
		 (princ "k==>")
                      (princ  k)
		 
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
      (setq mii (+ mii 1))
     (foreach space group123
	        (setq p 0)
                (setq j 0)
	        (setq pt1 0)
	        (setq pt2 0)
	        (setq pt3 0)
	        (setq pt4 0)
	    (setq space_x 0)
             (setq space_y 0)
	        ;(setq k (length lis))
	      (while (<  j  (length lis))
	           ;(setq space_x (nth 0 (nth j lis))) ;(princ lis)
		    ;(setq space_y (nth 1 (nth j lis)))
		(setq setx (nth 0 (nth j lis)))
		(setq sety (nth 1 (nth j lis)))
		(setq space_x setx)
		    (setq space_y sety)
                    (setq space_len (nth 0 (nth space di)))
		    (setq space_hgt (nth 1 (nth space di)))
		    (setq m 0)
		(if (and (<= (+ space_x space_len ) rlen) (<= (+ space_y space_hgt) rhgt))              ;last and first case 
                   (progn  (setq alt 0)
		       
		        (setq m (+ j 1))  ;(princ "let see")
			(while (< m (length lis))
				  (setq xi (nth 0 (nth m lis))) ;(princ "hello0000==>")(princ xi)
		                  (setq yi (nth 1 (nth m lis)))  ;(princ "yi==>")(princ yi)
			   (if (and (< space_x xi)  (< space_y yi))
                             (progn
			      (if (and (<= (+ space_x space_len) xi) (<= (+ space_y space_hgt) yi) (= p 0))
				        (progn
					 (setvar "cmdecho" 0)
   
                                          (command "._-layer" "_m" "Space" "_c" 10 "" "")
                                          (princ "yi==> 111111111====")
		                          (setq pt1 (list space_x space_y)) 
		                          (setq pt2 (list (+ space_x space_len) space_y))
	                                  (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                  (setq pt4 (list space_x (+ space_y space_hgt)))
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
					  (princ lis)
		                        )
				        (progn  (setq p 1)
				           (if (and (<= (+ space_x space_len) xi) (> (+ space_y space_hgt) yi))
					      (progn   (setq p 0)  (princ "yi==> 222222222====")
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
  
		                                                         (setq pt1 (list space_x space_y))
		                                                         (setq pt2 (list (+ space_x space_len) space_y))
	                                                                 (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                                                 (setq pt4 (list space_x (+ space_y space_hgt)))
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
					      (progn   (setq p 0) (princ "yi==> 3333333333====")
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
  
		                                                         (setq pt1 (list space_x space_y))
		                                                         (setq pt2 (list (+ space_x space_len) space_y))
	                                                                 (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                                                 (setq pt4 (list space_x (+ space_y space_hgt)))
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
                                     (setq alt 1)
			                )
			         
	                   
		                 )
	                    
	                     (if(= p 1)
			       (setq j (length lis))

			      )
		      (setq m (+ m 1))
			  )
		     
		   ;|  (if (= alt 0)
	              (progn                                                  (setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
  
		                                                         (setq pt1 (list space_x space_y))  (princ pt1)
		                                                         (setq pt2 (list (+ space_x space_len) space_y))
	                                                                 (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                                                 (setq pt4 (list space_x (+ space_y space_hgt)))
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
 

                                                            (command "-MTEXT" pt1 pt3 name "")
                                                 
                                                                      
                             
		      ;| (progn
			 	(setq j (+ j 1))
			        (setq ind (+ ind 1))
			        
			        (if (= ind (length lis))
				  (setq terminate 1)
				  )
		       )
			)
		      )  |;
		    )
		  (progn
		        (setq ta 0)
                      (setq j (+ j 1))
		    )
		  )
	
	  )
    )
 
          ;(setq i 0)
        ; (drawrect group123 di iii 0)
      (setq xii (+ xii 50))
      ; (if (= h (length group))
;	      (setq m (length group))
	     )
 
	    
  (setvar "osmode" old_osmode)
  
  )
;|(defun kya_baat()
  (setq old_osmode (getvar "osmode"))
   (setvar "osmode" 0)
   (setvar "cmdecho" 0)
  (setq group '(0 1 2 3))
  (setq di nil)
  (setq group123 nil)
  ;(setq lis1 nil)
  ;(setq lis (append lis(list (list 0 0))))
  (setq di (totalarea_g4 group))
  (setq mii 0)
  (setq iii 0)
    (while (< mii (length group))
      (setq h 0)
        (setq space 0)
      (setq di (totalarea_g4 group))
      (setq checked nil)
      (setq group123 nil)
  (setq checked (append checked (list 100)))
       (while (< h (length group))
	   (if (= h 0)
	       (progn
		     (setq space (nth mii group))
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
      (setq mii (+ mii 1))
          ;(setq i 0)
         (drawrect group123 di iii 0)
      (setq iii (+ iii 100))
      ; (if (= h (length group))
;	      (setq m (length group))
	     )
      
      
	 
; (setvar "osmode" old_osmode)
  )|;