(setq room0 (list '("area" . 144) '("name" . "Room 0") '("dims" . (12 10))))

(setq room1 (list '("area" . 180) '("name" . "BedRoom 1") '("dims" . (12 10))))

(setq room2 (list '("area" . 20) '("name" . "latr") '("dims" . (5 7))))

(setq room3 (list '("area" . 24) '("name" . "Bath1") '("dims" . (5 7))))

(setq room4 (list '("area" . 40) '("name" . "Kitchen") '("dims" . (5 8))))

(setq room5 (list '("area" . 100) '("name" . "DiningRoom") '("dims" . (10 10))))

(setq room6 (list '("area" . 120) '("name" . "Library") '("dims" . (12 12))))

(setq room7 (list '("area" . 64) '("name" . "StudyRoom1") '("dims" . (8 9))))
		  
(setq room8 (list '("area" . 64) '("name" . "StudyRoom2") '("dims" . (8 9))))

(setq room9 (list '("area" . 24) '("name" . "Bath2") '("dims" . (4 6))))

(setq room10 (list '("area" . 225) '("name" . "Drawing Room") '("dims" . (10 12))))

(setq room11 (list '("area" . 64) '("name" . "Room 11") '("dims" . (8 9))))

(setq room12 (list '("area" . 56) '("name" . "Room 12") '("dims" . (7 9))))

(setq room13 (list '("area" . 49) '("name" . "Room 13") '("dims" . (9 11))))

(setq room14 (list '("area" . 81) '("name" . "Room 14") '("dims" . (9 9))))

(setq room15 (list '("area" . 100) '("name" . "Room 15") '("dims" . (11 10))))
(setq alldim (list 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))
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
  (setq alldi nil)
  (setq alldimsn nil)
   (foreach space alldim
      (setq space_string (vl-princ-to-string space))
      (setq space_name (strcat "ROOM" space_string)) 
 
      (setq alldi (cdr (assoc "dims" (eval (read space_name)))))
      (setq alldimsn(append alldimsn(list alldi)))
    )
 ;(setq dim dimsn)
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
     (setq dimsn (vl-sort dimsn '(lambda (e1 e2) (> (car e1) (car e2)))))
    
     (setq w3  (nth 0 (nth 0 dimsn)))
     (setq w4  (nth 0 (nth 1 dimsn)))
     (setq mw2 (max w3 w4))
  (setq dimsn dim)
  (setq area 0)
  (setq area (* (+ h1 h2) (+ mw mw2)))
  (setq di nil)
  (setq di(append di(list (+ h1 h2 10) (+ w3 w4 40) alldimsn)))
  
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
  (setq alldi nil)
  (setq alldimsn nil)
   (foreach space alldim
      (setq space_string (vl-princ-to-string space))
      (setq space_name (strcat "ROOM" space_string)) 
 
      (setq alldi (cdr (assoc "dims" (eval (read space_name)))))
      (setq alldimsn(append alldimsn(list alldi)))
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
     (setq dimsn (vl-sort dimsn '(lambda (e1 e2) (< (car e1) (car e2)))))
    
     (setq w3  (nth 0 (nth 0 dimsn)))
     (setq w4  (nth 0 (nth 1 dimsn)))
     ;(setq mw2 (max w3 w4))
  (setq dimsn dim)
  (setq area 0)
  (setq area (* (+ h1 h2) (+ mw w3)))
  (setq di nil)
  (setq di(append di(list (+ h1 h2 8) (+ w4 w3 15) alldimsn)))
  
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
   (setq alldi nil)
  (setq alldimsn nil)
   (foreach space alldim
      (setq space_string (vl-princ-to-string space))
      (setq space_name (strcat "ROOM" space_string)) 
 
      (setq alldi (cdr (assoc "dims" (eval (read space_name)))))
      (setq alldimsn(append alldimsn(list alldi)))
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
      ;(setq mw (max w1 w2))  
     ;(setq dimsn (vl-sort dimsn '(lambda (e1 e2) (< (car e1) (car e2)))))
    
     ;(setq w3  (nth 0 (nth 1 dimsn)))
     ;(setq w4  (nth 0 (nth 3 dimsn)))
     ;(setq mw2 (max w3 w4))
  (setq dimsn dim)
  (setq area 0)
  (setq area (* h1 (+ w1 w2)))
  (setq di nil)
  (setq di(append di(list (+ h1 h2)  (+ w1 w2) alldimsn)))
  
  )
;(setq lis nil)
 ;     (setq lis (append lis(list (list 0 0))))
(defun drawrect(  / p1 p2 p3 p4)
  (setq old_osmode (getvar "osmode"))
   (setvar "osmode" 0)
   (setvar "cmdecho" 0)
   
   (command "._-layer" "_m" "Space" "_c" 10 "" "");(list (list 2 4 5 10) (list 13 12 15 11) (list 3 0 14 1) (list 8 6 7 9))recent
  ;3(setq group_g(list (list 9 10) (list 14 15) (list 2 13 11 12) (list 3 4 1 5) 1(list 6 7 8 0)))((9 10) (15 12 13 11) (14 4) (2 3 1 0) (7 8 6 5))2.9.9 overlap((10 4) (5 14) (11 12 13 15) (3 1 0 2) (8 6 7 9))
  ;1.9.9(list (list 9 10) (list 14 0) (list 11 12 13 15) (list 1 3 4 5) (list 6 7 2 8))2(list (list 10 11) (list 15 12 13 2) (list 8 14) (list 3 1 4 5) (list 6 7 0 9))top(list (list 10 14) (list 11 12 15 13) (list 5 0) (list 3 1 2 4) (list 6 7 8 9))
 (setq group_g (list (list 3 10 4 5) ))
 ; (setq group_g (newGA));(list (list 14 6 7 8) (list 13 11 12 15) (list 1 0 2 3) (list 9 4 10 5)))(list (list 11 12 13 15) (list 10 4 5 14) (list 0 1 2 3) (list 8 6 7 9)))
  ;2nd top(list (list 14 15) (list 11 12 13) (list 2 0 1 3) (list 5 4 7 6) (list 8 9 10))(list (list 10 14) (list 12 11 13) (list 2 0 1 3) (list 15 4 5) (list 7 8 6 9))
  (setq fin 0)
  (setq xii 0)
  (setq yii 0)
   (setq ffinal_list nil)
  (setq fgspace_name nil)
  (setq farea_groups nil)
    (setq fgdim nil)
  (while (< fin (length group_g))
   (setq final_list nil)
  (setq gspace_name nil)
  (setq area_groups nil)
    (setq gdim nil)
 
  (setq group (nth fin group_g))
  (setq ind 0)
  ;(while (<())
  (setq mii 0)
  (setq iii 0)
    (while (< mii (length group))
      (setq h11 0)
        (setq space11 0)
      (if (= 2 (length group))
       (setq arg (totalarea_g2 group)) 
	)
      (if (= 3 (length group))
       (setq arg (totalarea_g3 group))
	)
      (if (= 4 (length group))
       (setq arg (totalarea_g4 group)) 
	)
  
     (setq rlen 0)
     (setq rhgt 0)
     (setq di nil)
     (setq rlen (+ (nth 1 arg) xii))
     (setq rhgt (+ (nth 0 arg) yii))
     (setq di (nth 2 arg))
     
     (setq newarea (* rhgt rlen))
     (setq lis nil)
      (if (= xii yii)
	  (setq lis (append lis(list (list xii yii))))
          (setq lis (append lis(list (list xii 0) (list 0 yii))))
	)
     ; (setq lis (append lis(list (list rlen 0))))
       (setq lis (append lis(list (list rlen rhgt))))
     ;(princ (length lis))
     (setq terminate 0)
     (setq max_len 0)
     (setq max_hgt 0)
    ; (setq di (nth 2 arg))
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
      (setq group_lis nil)
     (setq firsti 0)
      (setq sfirsti 0)
      (foreach space group123
               ; (setq sfirsti ((+ sfirsti 1)))
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
		    (setq space_y sety) (princ di)
		    (setq space_len (nth 0 (nth space di)))
		    (setq space_hgt (nth 1 (nth space di)))
		    
		    (setq m 0) (princ "hello")
		(if (and (<= (+ space_x space_len ) rlen) (<= (+ space_y space_hgt) rhgt))              ;last and first case 
                   (progn  (setq alt 0) ;(princ "loooooooooooooooooooooooooookkkkkkkkkkkkkkk  ")
		       
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
					  (setq group_lis(append group_lis(list pt1 pt2 pt3 pt4)))
					 
	 (command "._-layer" "_m" "Space" "_c" 10 "" "")
            (command "._pline" pt1 pt2 pt3 pt4 "_c")
	   
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

  (setq name (cdr (assoc "name" (eval (read space_name)))))
 

  (command "text" pt1 1.000 0 name)

                                          (if (> (+ space_x space_len) max_len)                         ; cal max height and  max width
					       (setq max_len (+ space_x space_len))(princ max_len)
					    )
					  (if (> (+ space_y space_hgt) max_hgt)
					       (setq max_hgt (+ space_y space_hgt)) (princ max_hgt)
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
					  
					  	       
					  

                                           (setq ec 0)
					  
					   (setq deli 0)
					   (foreach ele_lis lis                                                ;if two points are (4,6) and (8,6) in lis then remove (4,6)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
					                                                 
                                                    
                                                    (if (and (> a space_x) (= b (+ space_y space_hgt)))
						         (setq ec 1)
						         (setq deli 1)
						       

					    )
						)
					 (if (and (= deli 1) (= ec 1))
                                          (setq lis lis)
                                                 
                                          (setq lis (cons (list space_x (+ space_y space_hgt)) lis))

					   )
					    
                                          (setq ec 0)
                                         (setq deli 0)
					   (foreach ele_lis lis                                                ;if two points are (4,8) and (4,12) in lis then remove (4,8)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
					                                                 
                                                    
                                                    (if (and (= a (+ space_x space_len)) (> b space_y))
						          (setq ec 1)
						         (setq deli 1)
						       

					    )
						)
					 (if (and (= deli 1) (= ec 1))
                                          (setq lis lis)
                                                 
                                         (setq lis (cons (list (+ space_x space_len) space_y) lis))

					   )

					 
                                        
					
		                       
					  (setq ad 0)
					 
					 (foreach ele_lis lis                                                     ;if two points are (15,11) and (12,0) in lis then add (15,0)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a (+ space_x space_len)) (= b 0))
						         (setq ad 1)
						      )
					)
					 (if (= ad 1)
						       
                                              (setq lis (append lis (list (list (+ space_x space_len) 0))))
					    
					    )
					 
					; (setq lis temp_lis)
					(setq ad 0)
					  (foreach ele_lis lis                                                     ;if two points are (15,20) and (0,10) in lis then remove (0,20)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a 0) (< b (+ space_y space_hgt)))
						         (setq ad 1)
						      )
					    )
					 (if (= ad 1)
						         (setq lis (append lis (list (list 0 (+ space_y space_hgt)))))
						       

					    
					    )
					 ;(setq lis temp_lis)
					 
					    (setq tem nil)
  (setq io 0)
  (while (< io (length lis))
    (setq ao (nth io lis))
    (setq jo (+ io 1))
  (setq te 0)
  (while (< jo (length lis))
      (setq bo (nth jo lis))
      (if (equal ao bo)
	  (setq te 1)
	)
    (setq jo (+ jo 1))
    )
	(if (= te 0)
	  (setq tem (append tem(list ao)))
	  )
    (setq io (+ io 1))
  )
  (setq lis tem)
					; (setq lis temp_lis)
					 (setq temp_lis nil)
					 
                                          (setq lis (vl-sort lis '(lambda (e1 e2) (< (cadr e1) (cadr e2)))))
                                          (setq lis (vl-sort lis '(lambda (e1 e2) (< (car e1) (car e2)))))
                                          ;(vl-remove '(space_x space_y) lis)
					  (setq j (length lis))
					  (setq m (length lis))
					  (princ lis)
		                        )
				        ( progn   ;(setq p 1)
				           (if (and (<= (+ space_x space_len) xi) (> (+ space_y space_hgt) yi))
					      (progn   (setq pio 0)  (princ "yi==> 222222222====")
						       (foreach membr lis
							    (if (and (< (nth 0 membr) xi) (> (nth 1 membr) yi))
						             (progn (setq pio 1)
							      )
							     )
							 )
							    
							 (if (= pio 0)
								       (progn
									  (setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
  
		                                                         (setq pt1 (list space_x space_y))
		                                                         (setq pt2 (list (+ space_x space_len) space_y))
	                                                                 (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                                                 (setq pt4 (list space_x (+ space_y space_hgt)))
									  (setq group_lis(append group_lis(list pt1 pt2 pt3 pt4)))
									 
	  (setvar "cmdecho" 0)
   
            (command "._-layer" "_m" "Space" "_c" 10 "" "")
            (command "._pline" pt1 pt2 pt3 pt4 "_c")
	   
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

  (setq name (cdr (assoc "name" (eval (read space_name)))))
 

  (command "text" pt1 1.000 0 name)

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
								
							(setq ec 0)
					  
					   (setq deli 0)
					   (foreach ele_lis lis                                                ;if two points are (4,6) and (8,6) in lis then remove (4,6)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
					                                                 
                                                    
                                                    (if (and (> a space_x) (= b (+ space_y space_hgt)))
						         (setq ec 1)
						         (setq deli 1)
						       

					    )
						)
					 (if (and (= deli 1) (= ec 1))
                                          (setq lis lis)
                                                 
                                          (setq lis (cons (list space_x (+ space_y space_hgt)) lis))

					   )
					    
                                          (setq ec 0)
                                         (setq deli 0)
					   (foreach ele_lis lis                                                ;if two points are (4,8) and (4,12) in lis then remove (4,8)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
					                                                 
                                                    
                                                    (if (and (= a (+ space_x space_len)) (> b space_y))
						          (setq ec 1)
						         (setq deli 1)
						       

					    )
						)
					 (if (and (= deli 1) (= ec 1))
                                          (setq lis lis)
                                                 
                                         (setq lis (cons (list (+ space_x space_len) space_y) lis))

					   )
		                                                         
					 (setq ad 0)
					 
					 (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a (+ space_x space_len)) (= b 0))
						         (setq ad 1)
						      )
					)
					 (if (= ad 1)
						       
                                              (setq lis (append lis (list (list (+ space_x space_len) 0))))
					    
					    )
					 
					; (setq lis temp_lis)
					(setq ad 0)
					  (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a 0) (< b (+ space_y space_hgt)))
						         (setq ad 1)
						      )
					    )
					 (if (= ad 1)
						         (setq lis (append lis (list (list 0 (+ space_y space_hgt)))))
						       

					    
					    )
									  (setq tem nil)
  (setq io 0)
  (while (< io (length lis))
    (setq ao (nth io lis))
    (setq jo (+ io 1))
  (setq te 0)
  (while (< jo (length lis))
      (setq bo (nth jo lis))
      (if (equal ao bo)
	  (setq te 1)
	)
    (setq jo (+ jo 1))
    )
	(if (= te 0)
	  (setq tem (append tem(list ao)))
	  )
    (setq io (+ io 1))
  )
  (setq lis tem)
									 
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
					      (progn   (setq piio 0) (princ "yi==> 3333333333====")
						       (foreach membr lis
							    (if (and (> (nth 0 membr) xi) (< (nth 1 membr) yi))
						             (progn (setq piio 1)
							      )
							     )
							 )
							(if (= piio 0)
								       (progn
									  (setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
  
		                                                         (setq pt1 (list space_x space_y))
		                                                         (setq pt2 (list (+ space_x space_len) space_y))
	                                                                 (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                                                 (setq pt4 (list space_x (+ space_y space_hgt)))
									  (setq group_lis(append group_lis(list pt1 pt2 pt3 pt4)))
									 
	  (setvar "cmdecho" 0)
   
           (command "._-layer" "_m" "Space" "_c" 10 "" "")
            (command "._pline" pt1 pt2 pt3 pt4 "_c")
	   
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

  (setq name (cdr (assoc "name" (eval (read space_name)))))
 

  (command "text" pt1 1.000 0 name)

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
								
								 (setq ec 0)
					  
					   (setq deli 0)
					   (foreach ele_lis lis                                                ;if two points are (4,6) and (8,6) in lis then remove (4,6)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
					                                                 
                                                    
                                                    (if (and (> a space_x) (= b (+ space_y space_hgt)))
						         (setq ec 1)
						         (setq deli 1)
						       

					    )
						)
					 (if (and (= deli 1) (= ec 1))
                                          (setq lis lis)
                                                 
                                          (setq lis (cons (list space_x (+ space_y space_hgt)) lis))

					   )
					    
                                          (setq ec 0)
                                         (setq deli 0)
					   (foreach ele_lis lis                                                ;if two points are (4,8) and (4,12) in lis then remove (4,8)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
					                                                 
                                                    
                                                    (if (and (= a (+ space_x space_len)) (> b space_y))
						          (setq ec 1)
						         (setq deli 1)
						       

					    )
						)
					 (if (and (= deli 1) (= ec 1))
                                          (setq lis lis)
                                                 
                                         (setq lis (cons (list (+ space_x space_len) space_y) lis))

					   )
		                                                       
						 (setq ad 0)
					 
					 (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a (+ space_x space_len)) (= b 0))
						         (setq ad 1)
						      )
					)
					 (if (= ad 1)
						       
                                              (setq lis (append lis (list (list (+ space_x space_len) 0))))
					    
					    )
					 
					; (setq lis temp_lis)
					(setq ad 0)
					  (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a 0) (< b (+ space_y space_hgt)))
						         (setq ad 1)
						      )
					    )
					 (if (= ad 1)
						         (setq lis (append lis (list (list 0 (+ space_y space_hgt)))))
						       

					    
					    )
									  (setq tem nil)
  (setq io 0)
  (while (< io (length lis))
    (setq ao (nth io lis))
    (setq jo (+ io 1))
  (setq te 0)
  (while (< jo (length lis))
      (setq bo (nth jo lis))
      (if (equal ao bo)
	  (setq te 1)
	)
    (setq jo (+ jo 1))
    )
	(if (= te 0)
	  (setq tem (append tem(list ao)))
	  )
    (setq io (+ io 1))
  )
  (setq lis tem)
									 
                                                                         (setq  lis (vl-sort lis '(lambda (e1 e2) (< (cadr e1) (cadr e2)))))
                                                                         (setq lis (vl-sort lis '(lambda (e1 e2) (< (car e1) (car e2)))))
                                                                        ; (vl-remove '(space_x space_y) lis)
									 (setq j (length lis))
									 (setq m (length lis))
		                                                        )
						                     )
								)
					     (progn

				                 (if (and (>= (+ space_x space_len) xi) (>= (+ space_y space_hgt) yi))
						       (progn
							       (setq xx (+ space_x space_len))
							  (setq yy (+ space_y space_hgt))
							      (if (>= xx 14)
                                                               (progn
								(setq xx (- xx 4))
								
								)
								(progn
							           (if (>= xx 10)
								     (progn
								 (setq xx (- xx 3))
								     )
								  (progn
						                     (if (>= xx 8)
								     (setq xx (- xx 2))
								       )
							  	   )
								     
								  )
								  )
								)
							      (if (>= yy 14)
								(progn
								    (setq yy (- yy 4))
								 )
								(progn
							          (if (>= yy 10)
                                                                    (progn
								      (setq yy (- yy 3))
								     )
								    (progn
						                       (if (>= yy 8)
								        (setq yy (- yy 2))
									 )
								      )
								    )
								  )
								)
							 (setq piii 0) (princ "yi==> 444444====")
							; (princ yy)
							 ;(princ xx)
						       (foreach membr lis
							   
							    (if (and (> (nth 0 membr) xx) (< (nth 1 membr) yy))
						             (progn (setq piii 1)
							      )
							     )
							 )
							 
							 (setq pii 0)
							 (foreach membr lis
							    (if (and (< (nth 0 membr) xx) (> (nth 1 membr) yy))
						             (progn (setq pii 1)
							      )
							     )
							 )  
							(if (= piii 0) 
							  (progn  
							     (if (<= yy yi)
							       (progn         ;(princ "hello") 
                                                     (setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
  
		                                                         (setq pt1 (list space_x space_y))
		                                                         (setq pt2 (list xx space_y))
	                                                                 (setq pt3 (list xx yy))
	                                                                 (setq pt4 (list space_x yy))
						      (setq group_lis(append group_lis(list pt1 pt2 pt3 pt4)))
						     
	  (setvar "cmdecho" 0)
   
           (command "._-layer" "_m" "Space" "_c" 10 "" "")
            (command "._pline" pt1 pt2 pt3 pt4 "_c")
	   
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

  (setq name (cdr (assoc "name" (eval (read space_name)))))
 

  (command "text" pt1 1.000 0 name)
		                           (if (> xx max_len)
					       (setq max_len xx)(princ max_len)
					    )
					  (if (> yy max_hgt)
					       (setq max_hgt yy) (princ max_hgt)
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
                                                    (if (and (= a space_x) (< b yy))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
					  (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a xx) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
								
							(setq ec 0)
					  
					   (setq deli 0)
					   (foreach ele_lis lis                                                ;if two points are (4,6) and (8,6) in lis then remove (4,6)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
					                                                 
                                                    
                                                    (if (and (> a space_x) (= b (+ space_y space_hgt)))
						         (setq ec 1)
						         (setq deli 1)
						       

					    )
						)
					 (if (and (= deli 1) (= ec 1))
                                          (setq lis lis)
                                                 
                                          (setq lis (cons (list space_x (+ space_y space_hgt)) lis))

					   )
					    
                                          (setq ec 0)
                                         (setq deli 0)
					   (foreach ele_lis lis                                                ;if two points are (4,8) and (4,12) in lis then remove (4,8)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
					                                                 
                                                    
                                                    (if (and (= a (+ space_x space_len)) (> b space_y))
						          (setq ec 1)
						         (setq deli 1)
						       

					    )
						)
					 (if (and (= deli 1) (= ec 1))
                                          (setq lis lis)
                                                 
                                         (setq lis (cons (list (+ space_x space_len) space_y) lis))

					   )
		                                                       
						 (setq ad 0)
					 
					 (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a xx) (= b 0))
						         (setq ad 1)
						      )
					)
					 (if (= ad 1)
						       
                                              (setq lis (append lis (list (list xx 0))))
					    
					    )
					 
					; (setq lis temp_lis)
					(setq ad 0)
					  (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a 0) (< b yy))
						         (setq ad 1)
						      )
					    )
					 (if (= ad 1)
						         (setq lis (append lis (list (list 0 yy))))
						       

					    
					    )
									  (setq tem nil)
  (setq io 0)
  (while (< io (length lis))
    (setq ao (nth io lis))
    (setq jo (+ io 1))
  (setq te 0)
  (while (< jo (length lis))
      (setq bo (nth jo lis))
      (if (equal ao bo)
	  (setq te 1)
	)
    (setq jo (+ jo 1))
    )
	(if (= te 0)
	  (setq tem (append tem(list ao)))
	  )
    (setq io (+ io 1))
  )
  (setq lis tem)
									 
                                                                         (setq  lis (vl-sort lis '(lambda (e1 e2) (< (cadr e1) (cadr e2)))))
                                                                         (setq lis (vl-sort lis '(lambda (e1 e2) (< (car e1) (car e2)))))
                                                                        ; (vl-remove '(space_x space_y) lis)
									 (setq j (length lis))
									 (setq m (length lis))
		                                                        )
							 )
						   )

                                            )
							 (if (= pii 0) 
							  (progn
							     (if (<= xx xi)
							       (progn
                                                     (setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
  
		                                                         (setq pt1 (list space_x space_y))
		                                                         (setq pt2 (list xx space_y))
	                                                                 (setq pt3 (list xx yy))
	                                                                 (setq pt4 (list space_x yy))
						      (setq group_lis(append group_lis(list pt1 pt2 pt3 pt4)))
						     
	  (setvar "cmdecho" 0)
   
            (command "._-layer" "_m" "Space" "_c" 10 "" "")
            (command "._pline" pt1 pt2 pt3 pt4 "_c")
	   
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

  (setq name (cdr (assoc "name" (eval (read space_name)))))
 

  (command "text" pt1 1.000 0 name)
									   (if (> xx max_len)
					       (setq max_len xx)
					    )
					  (if (> yy max_hgt)
					       (setq max_hgt yy)
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
                                                    (if (and (= a space_x) (< b yy))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
					  (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a xx) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
									
								  (setq ec 0)
					  
					   (setq deli 0)
					   (foreach ele_lis lis                                                ;if two points are (4,6) and (8,6) in lis then remove (4,6)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
					                                                 
                                                    
                                                    (if (and (> a space_x) (= b (+ space_y space_hgt)))
						         (setq ec 1)
						         (setq deli 1)
						       

					    )
						)
					 (if (and (= deli 1) (= ec 1))
                                          (setq lis lis)
                                                 
                                          (setq lis (cons (list space_x (+ space_y space_hgt)) lis))

					   )
					    
                                          (setq ec 0)
                                         (setq deli 0)
					   (foreach ele_lis lis                                                ;if two points are (4,8) and (4,12) in lis then remove (4,8)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
					                                                 
                                                    
                                                    (if (and (= a (+ space_x space_len)) (> b space_y))
						          (setq ec 1)
						         (setq deli 1)
						       

					    )
						)
					 (if (and (= deli 1) (= ec 1))
                                          (setq lis lis)
                                                 
                                         (setq lis (cons (list (+ space_x space_len) space_y) lis))

					   )
		                                                       
						 (setq ad 0)
					 
					 (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a xx) (= b 0))
						         (setq ad 1)
						      )
					)
					 (if (= ad 1)
						       
                                              (setq lis (append lis (list (list xx 0))))
					    
					    )
					 
					; (setq lis temp_lis)
					(setq ad 0)
					  (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a 0) (< b yy))
						         (setq ad 1)
						      )
					    )
					 (if (= ad 1)
						         (setq lis (append lis (list (list 0 yy))))
						       

					    
					    )
									  (setq tem nil)
  (setq io 0)
  (while (< io (length lis))
    (setq ao (nth io lis))
    (setq jo (+ io 1))
  (setq te 0)
  (while (< jo (length lis))
      (setq bo (nth jo lis))
      (if (equal ao bo)
	  (setq te 1)
	)
    (setq jo (+ jo 1))
    )
	(if (= te 0)
	  (setq tem (append tem(list ao)))
	  )
    (setq io (+ io 1))
  )
  (setq lis tem)
									 
                                                                         (setq  lis (vl-sort lis '(lambda (e1 e2) (< (cadr e1) (cadr e2)))))
                                                                         (setq lis (vl-sort lis '(lambda (e1 e2) (< (car e1) (car e2)))))
                                                                        ; (vl-remove '(space_x space_y) lis)
									 (setq j (length lis))
									 (setq m (length lis))
		                                                        )
							 )
						   )

                                            )
							 
                                          (if (/= j (length lis))
					    (progn
					    (setq j (+ j 1))
					    (setq m (length lis))
					    )
					    ;(setq p 1)
					    )

					     )
					            
							      )
							 )
					  )
						   
					       )
                                       (if (/= j (length lis))
					    (progn
					    (setq j (+ j 1))
					    (setq m (length lis))
					    )
					    ;(setq p 1)
					    )


					  )
					    
                                                     
				             
			         	)				     
                                     (setq alt 1)
			                )
			     (progn
			           (setq j (+ j 1))
			           (setq m (+ m 1))
			       )
			    ;| (progn
			           (if (= firsti 0)
				     (progn
				        (setq lis nil)
				          (setq lis (append lis(list (list 0 space_hgt))))
				         (setq lis (append lis(list (list space_len 0))))
				         (setq lis (append lis(list (list rlen rhgt))))
				        (setq pt1 (list space_x space_y)) 
		                          (setq pt2 (list (+ space_x space_len) space_y))
	                                  (setq pt3 (list (+ space_x space_len) (+ space_y space_hgt)))
	                                  (setq pt4 (list space_x (+ space_y space_hgt)))
					  (setq group_lis(append group_lis(list pt1 pt2 pt3 pt4)))
				          (setq j (length lis))
				          (setq firsti 1)
				          (setq m (length lis))
				       )
				     (progn
			           (setq j (+ j 1))
				    (setq m (length lis))
				   )
				     )
			       )|;
	                   
		                 )
	                    
	                     (if(= p 1)
			       (setq j (length lis))

			      )
		     
			  )
		     
		
		    )
		  (progn
		        (setq ta 0)
                      (setq j (+ j 1))
		    )
		  )
	
	  )
    )  ; foreach space loop ends here
   ; (princ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    ;  (princ (/ (length group_lis) 4))
    

      (setq max_len 0)
      (setq max_hgt 0)
          ;(setq i 0)
        ; (drawrect group123 di iii 0)
      (setq xii (+ xii 100))
      ; (if (= h (length group))
;	      (setq m (length group))
  )                                              ; outer while
 
    
(setq fin (+ fin 1))
 )
  )


  
 