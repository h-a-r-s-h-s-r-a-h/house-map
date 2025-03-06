;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Function for OX Cross-Over Operator
;(((11 12 13 15)(14 0 1 2)(5 10 4 3)(7 8 9 6))((6.3202 6.09416 7.95236 9.10094) (7.41502 11.8724 11.7463 4.65472) (8.93903 8.30379 4.25783 4.24103) (6.9577 7.71208 3.27695 10.4331))((7.88224 8.74665 9.13068 9.46466) (8.61131 10.7543 8.89337 6.15308) (8.73435 11.7393 7.03429 6.52999) (7.50496 7.6244 5.86644 10.4067)))   (((11 12 13 15)(14 0 1 2)(5 10 4 3)(7 8 9 6))((7.22858 5.87283 7.91289 10.2138) (7.0217 11.7713 10.5984 4.62276) (9.68987 8.11042 4.7576 4.60102) (7.98893 6.56825 3.08143 10.6428))((8.38348 7.11912 9.5542 8.11948) (7.76365 9.13396 8.71477 6.81906) (9.44908 11.9444 6.76982 6.5093) (8.87988 8.10506 4.04704 11.8364)))
(defun crossover (parents / listAllElements firstParent secondParent firstCut secondCut temp firstChild secondChild i output)
   (setq listAllgroups group_g)
 ; (princ "cross")
  ;(setq width_element  )
  ;(setq height_element )
  (setq firstParent (nth 0 (nth 0 parents)))
  (setq firstParentWidth (nth 1 (nth 0 parents)))
  (setq firstParentHeight (nth 2 (nth 0 parents)))
  (setq secondParent (nth 0 (nth 1 parents)))
  (setq secondParentWidth (nth 1 (nth 1 parents)))
  (setq secondParentHeight (nth 2 (nth 1 parents)))
  
  (setq firstCut 1)
  
  (setq firstChild nil)
  (setq firstChildWidth nil)
  (setq firstChildHeight nil)
  (setq secondChild nil)
  (setq secondChildWidth nil)
  (setq secondChildHeight nil)
  
  (setq rand (fix (* (randnum) 4)))
  (setq firstChild (append firstChild (list (nth rand secondParent))))
  (setq firstChild (append firstChild (cdr firstParent)))
  (setq firstgeneC (car firstParent));(princ rand)
  ;(princ firstChild)(princ "\n")
 ; (princ firstgeneC)(princ "\n")
  (setq firstChildWidth (append firstChildWidth (list (nth rand secondParentWidth))))
  (setq firstChildWidth (append firstChildWidth (cdr firstParentWidth)))
  
  (setq firstgeneCW (car firstParentWidth))
  (setq firstChildHeight (append firstChildHeight (list (nth rand secondParentHeight))))
  (setq firstChildHeight (append firstChildHeight (cdr firstParentHeight)))
  (setq firstgeneCH (car firstParentHeight))
  (setq rand1 (fix (* (randnum) 4)))
  (setq secondChild (append secondChild (list (nth rand1 firstParent))))
  (setq secondChild (append secondChild (cdr secondParent)))
  (setq secondgeneC (car secondParent))
  (setq secondChildWidth (append secondChildWidth (list (nth rand1 firstParentWidth))))
  (setq secondChildWidth (append secondChildWidth (cdr secondParentWidth)))
  (setq secondgeneCW (car secondParentWidth))
  (setq secondChildHeight (append secondChildHeight (list (nth rand1 firstParentHeight))))
  (setq secondChildHeight (append secondChildHeight (cdr secondParentHeight)))
  (setq secondgeneCH (car secondParentHeight))
 ; (princ "cross1")
  
  (setq firstChild (slidingMotion firstChild firstChildWidth firstChildHeight listAllgroups firstgeneC firstgeneCW firstgeneCH))
  (setq secondChild (slidingMotion secondChild secondChildWidth secondChildHeight listAllgroups secondgeneC secondgeneCW secondgeneCH))
  (setq output (list firstChild secondChild))
  )

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Function for generating random number within a range
(defun randomFromRange (start end)
  (fix (+ start (* (randnum) end)))
  )

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Generate a Random Number
(defun randnum (/ modulus multiplier increment random)

  (if (not seed)
    (setq seed (getvar "DATE"))
    )

  (setq modulus    65536
	multiplier 25173
	increment  13849
	seed  (rem (+ (* multiplier seed) increment) modulus)
	random     (/ seed modulus)
	)
  )
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Sliding Motion for Duplicate elements in a off-spring
(defun slidingMotion (child childWidth childHeight allGroups gene1c gene1w gene1h / childWHfinal)
  (setq i 0)
  (setq break 0)
  (setq k 0)
  (setq childnew nil
	childnewW nil
	childnewH nil
	)
 
 (setq ch 0)
 
(while (and (< i (length child))(= break 0))
	      (setq j (+ i 1))
       	 (setq ch1 (nth j child))
	 (setq ch (nth 0 child))
          (setq ph 0)
	 (foreach ele ch
	   (foreach elem ch1
	      (if (= ele elem)
		(progn
		(setq ph (+ ph 1))
                (if (= ph 4)
		  (progn
                   (setq k j)
                   (setq break 1)
		   )
                 )
		)
		)
	     )
	   )
  (setq i (+ i 1))
	   
    ); (princ



  
  (if (= break 0)
    (progn (setq childWH (list child childWidth childHeight))
      ;(princ child)
      )
    )
  (if (= break 1)
    (progn
     (setq i 0)
     (foreach element child
      (if (= i k)
	 (setq childnew (append childnew (list gene1c)))
	 (setq childnew (append childnew (list element)))
	)
       (setq i (+ i 1))
       )
       (setq i 0)
       (foreach element childWidth
      (if (= i k)
	 (setq childnewW (append childnewW (list gene1w)))
	 (setq childnewW (append childnewW (list element)))
	)
       (setq i (+ i 1))
       )
      (setq i 0)
       (foreach element childHeight
      (if (= i k)
	 (setq childnewH (append childnewH (list gene1h)))
	 (setq childnewH (append childnewH (list element)))
	)
       (setq i (+ i 1))
       )
     (setq i 0)
  (setq childWH (list childnew childnewW childnewH))
   ;(princ "\n")(princ childnew)
     
     
    )
    )
 ;************************************************************************************
 ; (princ childWH) (princ "\n")
  ;(princ "cross3")
  (setq h11 0)
  (setq mii 0)
  (setq childnew1 (nth 0 childWH))
  ;(princ "\n")(princ childnew1)
  ;(princ "cross4")(princ "\n")
(setq checked nil)
      (setq group123 nil)
  ;(setq checked (append checked (list )))
       (while (< h11 (length childnew1))
	   (if (= h11 0)
	       (progn
		     (setq space11 mii)
		     ;(drawrect space di)
		     (setq group123 (append group123(list space11)))
		; (princ "h==>")
		 ;(princ  space11)
		)
	       (progn
                      ;(setq ji (- j 1))
		      (setq k nil)
		 ;(princ  "\n")
		 ;(princ "h==>")
		      ; (princ h11)
		; (princ "cross5")(princ "\n")
		 (setq checked(append checked(list (nth space11 childnew1))))
		      (setq k (grpprox (nth space11 childnew1) childnew1 checked))
		; (princ "cross6")
		 ;(princ  "\n")
		 ;(princ "k==>")
                     ; (princ  k)
		 
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
 ; (princ "cross4")
  (setq i 0)
  (setq newchild nil)
  (setq newchildW nil)
  (setq newchildH nil)
  (while (< i (length group123))
        (setq a (nth i group123))
        (setq ele (nth a (nth 0 childWH)))
        (setq newchild (append newchild (list ele)))
        (setq ele (nth a (nth 1 childWH)))
        (setq newchildW (append newchildW (list ele)))
        (setq ele (nth a (nth 2 childWH)))
        (setq newchildH (append newchildH (list ele)))
    
        (setq i (+ i 1))
    )
 ;(princ "cross5")
  
  (setq childWHfinal (list newchild newchildW newchildH))
 ; (princ childWHfinal) 
  )

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------


;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Find Maximum Adjacency of an element with another element
(defun maximumAdjacencyWithElement (adjacentElement / arr maxElement index pos answer)
  (setq arr
      '(
;|0 bedroom1   |;	(0 8 6 6 8 6 9 6 4 5 3 2 2 2 8 6)
;|1 bed room2|;	        (8 0 6 6 8 6 9 6 4 5 3 2 2 2 8 6)
;|2 guest rm3|; 	(6 6 0 8 6 8 6 9 4 4 3 6 6 4 4 6)
;|3 treasury rm4|;	(6 6 8 0 6 8 6 9 4 4 3 4 4 4 4 6)
;|4 BA1        |;	(8 8 6 6 0 6 9 10 2 2 2 2 2 2 4 2)
;|5 BA2      |; 	(6 6 8 8 6 0 10 9 6 2 2 2 2 2 4 2)
;|6 WC1   |;     	(9 9 6 6 9 10 0 6 2 2 2 2 2 2 4 2)
;|7 WC2  |;      	(6 6 9 9 10 9 6 0 6 6 4 4 4 4 4 6)
;|8 living |;	        (4 4 4 4 2 6 2 6 0 8 6 6 6 6 6 9)
;|9 dining|;    	(5 5 4 4 2 2 2 6 8 0 10 4 4 4 6 4)
;|10 kitchen|;    	(3 3 3 3 2 2 2 4 6 10 0 2 2 2 4 4)
;|11 std1|;      	(2 2 6 4 2 2 2 4 6 4 2 0 8 10 2 9)
;|12 std2    |;  	(2 2 6 4 2 2 2 4 6 4 2 8 0 10 2 9)
;|13 lib|;       	(2 2 4 4 2 2 2 4 6 4 2 10 10 0 2 4)
;|14 play room|; 	(8 8 4 4 4 4 4 4 6 6 4 2 2 2 0 6)
;|15 Ent        |;	(6 6 6 6 2 2 2 6 9 4 4 9 9 4 6 0)



      )
 )
  (setq maxElement (apply 'max (nth adjacentElement arr)))
  (setq index 0)
  (setq pos 0)
  (foreach element (nth adjacentElement arr)
    (if
      (= maxElement element)
      (setq pos index)
      )
    (setq index (+ index 1))
    )
  (setq answer pos)
  )

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Replace an element in list
(defun replace-n (new n lst / )
  (mapcar '(lambda (a) (if (= (setq n (1- n)) -1) new a)) lst)
  )

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------