;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Function for OX Cross-Over Operator

(defun crossover (parents / listAllElements firstParent secondParent firstCut secondCut temp firstChild secondChild i output)
   (setq listAllElements (list 0 1 2 3 4 5 6 7 8))
   (setq firstParent (nth 0 parents))
  (setq secondParent (nth 1 parents))

  (setq firstCut 0)
  (setq secondCut 0)

  (while
    (= firstCut secondCut)
    (setq firstCut (randomFromRange 1 (- (length firstParent) 1)))
    (setq secondCut (randomFromRange 1 (- (length firstParent) 1)))
    )

  (if
    (< secondCut firstCut)
    (progn
      (setq temp secondCut)
      (setq secondCut firstCut)
      (setq firstCut temp)
      )
    )

  (setq firstChild nil)
  (setq secondChild nil)
  
  (setq i 0)
  (while
    (< i (length firstParent))
    (if
      (or
	(< i firstCut)
	(>= i secondCut)
	  )

      (progn
	(setq firstChild (append firstChild (list (nth i firstParent))))
	(setq secondChild (append secondChild (list (nth i secondParent))))
	)

      (progn
	(setq firstChild (append firstChild (list (nth i secondParent))))
	(setq secondChild (append secondChild (list (nth i firstParent))))
	)
      )

    (setq i (+ i 1))
    )

  (setq firstChild (slidingMotion firstChild listAllElements firstCut secondCut))
  (setq secondChild (slidingMotion secondChild listAllElements firstCut secondCut))
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
(defun slidingMotion (child allElements cutOne cutTwo / i loop deletions value toBeAdded maxAdj index offSpring)

  (setq i cutOne)
  (setq loop 0)
  (while
    (< loop (- (length child) (- cutTwo cutOne)))
     (while
       (and
	 (>= i cutOne)
	 (< i cutTwo)
       )
	(foreach element (nth i child)
	  (setq allElements (vl-remove element allElements))
	)
	(setq i (+ i 1))
     )
;(princ "\n")(princ i)
     (setq deletions 0)
     (foreach element (nth i child)
       (if
	 (/= nil (member element allElements))
	  (progn
	    (setq allElements (vl-remove element allElements))
	  )
	  (progn
	    (foreach group child
	      (if
		(= group (nth i child))
		(progn
		  (setq value (vl-remove element group))
		  (setq child (replace-n value i child))
		  )
		)
	      )
	    (setq deletions (+ 1 deletions))
	  )
       )
     )

    (while
      (and
	 (/= deletions 0)
	 (/= allElements nil)
	 )
	 (setq toBeadded (nth 0 allElements))
	 (foreach group child
	   (if
	     (= group (nth i child))
	     (progn
	       (setq value (append group (list toBeAdded)))
	       (setq child (replace-n value i child))
	       )
	     )
	   )
	 (setq allElements (vl-remove toBeAdded allElements))
	 (setq deletions (- deletions 1))
       )
    (setq i (rem (+ i 1) (length child)))
    (setq loop (+ loop 1))
  )
;(princ (length allElements))
  (while
    (/= allElements nil)
    (setq toBeadded (nth 0 allElements))
    (setq maxAdj (maximumAdjacencyWithElement toBeAdded))
    (setq index 0);(princ "hjkk")
    (foreach group child
      (if
	(/= nil (member maxAdj group))
	(progn
	  (setq value (append group (list toBeAdded)))
	  (setq child (replace-n value index child))
	  )
	)
      (setq index (+ 1 index))
      )
    (setq allElements (vl-remove toBeAdded allElements))
    )
  (setq child (vl-remove nil child))
   
  (setq offSpring child)

  )

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------


;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Find Maximum Adjacency of an element with another element
(defun maximumAdjacencyWithElement (adjacentElement / arr maxElement index pos answer)
  (setq arr (matrix))
    ;| '(
		   (0 8 6 6 4 6 7 6 4 5 3 2 2 2 8 6)
		   (8 0 6 10 8 6 7 6 4 5 3 2 2 2 8 6)
		   (6 6 0 8 6 8 8 9 4 4 3 6 6 4 4 6)
		   (6 10 8 0 6 8 6 9 4 4 3 4 4 4 4 6)
		   (4 8 6 6 0 10 5 5 2 2 8 2 2 2 4 2)
		   (6 6 8 8 10 0 8 7 6 2 9 5 2 2 4 2)
		   (7 7 8 6 5  8 0 10 10 8 2 2 2 2 4 2)
		   (6 6 9 9 5 7 10 0 6 6 4 4 4 4 4 6)
		   (4 4 4 4 2 6 10 6 0 8 6 6 6 6 6 9)
		   (5 5 4 4 2 2 8 6 8 0 10 4 4 4 6 4)
		   (3 3 3 3 8 9 2 4 6 10 0 2 2 2 4 4)
		   (2 2 6 4 2 5 2 4 6 4 2 0 8 10 2 9)
		   (2 2 6 4 2 2 2 4 6 4 2 8 0 10 2 9)
		   (2 2 4 4 2 2 2 4 6 4 2 10 10 0 2 4)
		   (8 8 4 4 4 4 4 4 6 6 4 2 2 2 0 6)
		   (6 6 6 6 2 2 2 6 9 4 4 9 9 4 6 0)
		  )
 )|;
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