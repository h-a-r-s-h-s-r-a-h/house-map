(setq adj_pair nil)

; Start of function addpair

(defun addpair(i j)
  
   ;(princ "In Add Pair")
   ;(princ i)
   ;(princ j)
  
   (setq adj_pair (cons (list i j) adj_pair))
)

;End of Function addpair

;SOF already_in_group

(defun already_in_group(i j)
  (setq in_group "false")
  (foreach element adj_pair

     ;(princ element)
     (if (or (equal element (list i j))
             (equal element (list j i))
	 )

       (progn

	 ;(princ "In if")
	 
         (setq in_group "true")
       )

       ;(princ "In else")
     )
    
  )
 in_group
)

;EOF already_in_group


;SOF ACESS

( defun c:access (/ i j)

  ; The matrix represents adjacency of DR, KIT, OF1, OF2, LIB

  ;       DR  KIT  OF1 OF2 LIB
  ; DR    0   10   4   4   4
  ; KIT   10  0    2   2   4
  ; OF1   4   2    0   8   10
  ; OF2   4   2    8   0   10
  ; LIB   4   4    10  10  0
  ;
  ;


   (setq arr
      '(
	(0  10 4  4  4)
	(10 0  2  2  4)
	(4  2  0  8  10)
	(4  2  8  0  10)
	(4  4  10 10 0)
       )
   )

  ; Iinitializing the size of the adjacency matrix which is equal to number of spaces

  (setq num_spaces 5)

  ; Initializing counter to access rows of the matrix
  (setq i 0)
 
  ; Accessing the elemesnts of the adjacency matrix

 (while (< i num_spaces)

   (setq templist (nth i arr))
   (setq j 0)
   (while (< j num_spaces)
     
     ;(princ (nth j templist))

     (setq weight (nth j templist))

     ;(princ "Inside Whiles")
     
     (if (and (= weight 10) (= (already_in_group i j) "false") )
       (progn
	   ;(princ "Inside if")
           (addpair i j)

       ) ;End of progn
     )
     (setq j (+ j 1))
     ;(princ "    ")
   )
   ;(princ "\n")
   (setq i (+ i 1))
 )

  (princ adj_pair)

  (princ)
  

)

;EOF ACCESS