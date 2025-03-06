
;(((3 5 4 10) (14 0 1 2) (7 8 9 6) (11 12 13 15)) ((6.92904 8.8919 6.88323 8.378) (7.60739 10.2046 8.47412 4.77729) (7.05895 8.52988 3.04112 11.308) (6.52331 6.80773 7.16022 10.3842)) ((4.01755 8.34592 4.3014 11.8008) (7.20648 10.1609 10.7317 5.04114) (6.81753 6.2844 4.88646 11.1002) (8.68138 7.42108 10.6957 8.36255)))
(setq room0 (list '("area" . 132) '("name" . "Room 1") '("dims" . (12 11))))

(setq room1 (list '("area" . 120) '("name" . "BedRoom 1") '("dims" . (12 10))))

(setq room2 (list '("area" . 35) '("name" . "latr") '("dims" . (5 7))))

(setq room3 (list '("area" . 35) '("name" . "Bath1") '("dims" . (5 7))))

(setq room4 (list '("area" . 40) '("name" . "Kitchen") '("dims" . (5 8))))

(setq room5 (list '("area" . 100) '("name" . "DiningRoom") '("dims" . (10 10))))

(setq room6 (list '("area" . 144) '("name" . "Store") '("dims" . (12 12))))

(setq room7 (list '("area" . 72) '("name" . "StudyRoom1") '("dims" . (8 9))))
		  
(setq room8 (list '("area" . 72) '("name" . "StudyRoom2") '("dims" . (8 9))))

(setq room9 (list '("area" . 24) '("name" . "Bath2") '("dims" . (4 6))))

(setq room10 (list '("area" . 120) '("name" . "Drawing Room") '("dims" . (10 12))))

(setq room11 (list '("area" . 72) '("name" . "Children Room") '("dims" . (8 9))))

(setq room12 (list '("area" . 63) '("name" . "Guest Room") '("dims" . (7 9))))

(setq room13 (list '("area" . 99) '("name" . "BedRoom2") '("dims" . (9 11))))

(setq room14 (list '("area" . 81) '("name" . "TreasuryRoom") '("dims" . (9 9))))

(setq room15 (list '("area" . 110) '("name" . "PoojaRoom") '("dims" . (11 10))))


(setq h 30.0
	w 44.0
	height nil
	width  nil
	area_bay 0.0
	final_area 0.0
	bh 0.0
	hi 0.0
  )
;(setq width (list 6.92904 8.8919 6.88323 8.378 10.20459 10.2046 8.47412 4.77729 7.05895 8.52988 3.04112 11.308 6.52331 9.21083 10.3842 10.3842))
;(setq height (list 4.01755 8.34592 4.3014 11.8008 7.20648 10.1609 12.63262 5.04114 6.81753 6.2844 6.88646 11.1002 8.68138 10.21842 11.6957 11.3842))
;(setq bays (list (list 3 5 4 10) (list 14 0 1) (list 2 7 8 9) (list 6 11 12) (list 13 15)))
;(setq sw (list (list 6.92904 8.8919 6.88323 8.378) (list 18.5826 18.5826 17.366) (list 22.1433 24.425 27.1125 21.6237) (list 32.9317 33.6358 33.6358) (list 44.02 44.02)))
(setq width (list 11.1528 8.09909 7.48023 4.41805 9.62104 7.29311 8.09946 4.46876 6.25767 6.23674 6.23669 11.0324 10.6924 10.6924 7.21004 7.79193))
(setq height(list 9.07241 11.1727 9.75489 6.43183 8.9255 5.57026 10.0454 5.77851 10.80252 8.87457 7.49021 11.4691 8.09586 8.66938 13.23476 13.23476))
(setq bays(list (list 0 1 14) (list 2 5 4) (list 10 3 7) (list 8 9 6) (list 15 11 13) (list 12)))
(setq sw(list (list 11.1528 8.09909 7.48023) (list 11.8983 17.7201 15.3922) (list 23.4916 22.1889 23.9778) (list 30.2145 30.2145 34.524) (list 45.2165 45.2165 37.4246) (list 45.2165)))
(defun drawm( / p1 p2 p3 p4)
  (setq old_osmode (getvar "osmode"))
   (setvar "osmode" 0)
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
       (setq space_x 0)
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
	(setq space_x 0)
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
	                                (setq space_x (nth j (nth i sw)))
                                        (setq space_y h)
					)
					 (progn
					   	(setq space_x (nth j (nth i sw)))
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
	                                (setq space_x (nth j (nth i sw)))
                                        (setq space_y 0)
					)
					 (progn
					   	(setq space_x (nth j (nth i sw)))
      	                                        
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
  (setvar "osmode" old_osmode)
  )