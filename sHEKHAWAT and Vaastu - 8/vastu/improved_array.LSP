; GENERATION OF GROUPS FROM GIVEN ADJACENCY MATRIX
;--------------------------------------------------------------------------------------------------------------------------

(setq adj_pair nil)
(setq all_adj_pair nil)
(setq used_rows nil)

;--------------------------------------------------------------------------------------------------------------------------
; This function checks the row is already used or not

(defun checkrow(m / k)
  	(setq k 0)
  	(setq condition 0)
  	(while (< k (length used_rows))
    		(if (= m (nth k used_rows))
     			 (progn
				(if (= condition 0)
				(setq condition 1)
        			)
    		 	)
  		)
    		(setq k (+ k 1))
    	)
)

;--------------------------------------------------------------------------------------------------------------------------
; This function adds the row to the list of used rows

(defun addrow(g)
    (setq used_rows (cons g used_rows))
)

;--------------------------------------------------------------------------------------------------------------------------
; This function is used to add the tuples to final list

(defun addlist(list_pair / pair)
   (foreach pair list_pair
   	(setq all_adj_pair (append all_adj_pair (list pair)))
   )
)

;--------------------------------------------------------------------------------------------------------------------------
; This function adds i j pair to a list

(defun addpair(a b)
   (setq adj_pair (append adj_pair (list (list a b -1))))
)

;--------------------------------------------------------------------------------------------------------------------------
;MAIN FUNCTION

(defun create_pair (/ i j k)

  ; The matrix represents adjacency of DR, KIT, OF1, OF2, LIB

  ;       DR  KIT  OF1 OF2 LIB
  ; DR    0   10   4   4   4
  ; KIT   10  0    2   2   4
  ; OF1   4   2    0   8   10
  ; OF2   4   2    8   0   10
  ; LIB   4   4    10  10  0
  ;
  ;

;;;  (setq arr
;;;	 '(
;;;	   (0 10 4 4 4)
;;;  	   (10 0 2 2 4)
;;;	   (4 2 0 8 10)
;;;	   (4 2 8 0 10)
;;;	   (4 4 10 10 0)s
;;;	   )
;;;	)
  (setq arr
      '(
	(0 8 6 6 8 6 9 6 4 5 3 2 2 2 8 6)
	(8 0 6 6 8 6 9 6 4 5 3 2 2 2 8 6)
	(6 6 0 8 6 8 6 9 4 4 3 6 6 4 4 6)
	(6 6 8 0 6 8 6 9 4 4 3 4 4 4 4 6)
	(8 8 6 6 0 6 9 10 2 2 2 2 2 2 4 2)
	(6 6 8 8 6 0 10 9 6 2 2 2 2 2 4 2)
	(9 9 6 6 9 10 0 6 2 2 2 2 2 2 4 2)
	(6 6 9 9 10 9 6 0 6 6 4 4 4 4 4 6)
	(4 4 4 4 2 6 2 6 0 8 6 6 6 6 6 9)
	(5 5 4 4 2 2 2 6 8 0 10 4 4 4 6 4)
	(3 3 3 3 2 2 2 4 6 10 0 2 2 2 4 4)
	(2 2 6 4 2 2 2 4 6 4 2 0 8 10 2 9)
	(2 2 6 4 2 2 2 4 6 4 2 8 0 10 2 9)
	(2 2 4 4 2 2 2 4 6 4 2 10 10 0 2 4)
	(8 8 4 4 4 4 4 4 6 6 4 2 2 2 0 6)
	(6 6 6 6 2 2 2 6 9 4 4 9 9 4 6 0)
      )
 )                                   ; initializing the size of the adjacency matrix which is equal to number of spaces

  (setq num_spaces 16)                ; Initializing counter to access rows of the matrix
  (setq i 0)
  (setq check_weight 10)
  (while (> check_weight 0)
    
                                      ; Initializing counter to access rows of the matrix
  	(setq i 0)
   	(while (< i num_spaces)
		(setq templist (nth i arr))
   		(setq j (+ i 1))
	  	(setq var 1)
	  	(setq row_condition 0)
		(while (< j num_spaces)	
			(setq weight (nth j templist))
     			(if (= weight check_weight)
       				(progn
     					(checkrow i)
					(if (= condition 0)
       						(progn
           								(addpair i j)
	   								(setq row_condition 1)
						  			(addrow j)

       						) ;End of progn
			               
		  				(progn
							(checkrow j)
			  				(if (= condition 0)
				  				(progn
								  	(setq k 0)
								  	(while (< k j)
									  	(setq wt (nth k (nth j arr)))
									  	(if(= wt check_weight)
										  (progn
										    	;(princ j)(princ " ")(princ k)
 				       							(addpair j k)
				       							(addrow j)
										    )
										  )
									  	(setq k (+ k 1))
									 )
				  				)
				 			)
			 	 		)
     					)	
       				)
     			)
     		       (setq j (+ j 1))
     		  )                                ;end of while 1
	  	  (if (= row_condition 1)
			(addrow i)
		    )
                 (setq i (+ i 1))
                (setq var 0)
          )
   
   (setq check_weight (- check_weight 1))       ; reducing weight by 1
                                                ;(princ adj_pair)(princ)
   (if (/= adj_pair nil)
     (addlist adj_pair)
   )                                            ;adding pairs of particular checkweight to final list of pairs
   (setq adj_pair nil)                          ;setting adjacency pair to nill in order to create a new list everytime
 )                                              ;end of while2
                                                ;(princ used_rows)
  ;(princ all_adj_pair)

  ;(princ)
  ; call to next segment
  (setq output all_adj_pair)  

)

;--------------------------------------------------------------------------------------------------------------------------
	