										;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
										;Function for Roulette Wheel Selection

(defun rouletteWheel (population numberOfChromosomes)
;;;  (setq population (list 8 2 17 7 4 11))
;;;  (setq numberOfChromosomes 1)
  (setq individuals nil)

										;Calculate Sum of Fitness of All Chromosomes
  (setq totalSum 0.0)
  (foreach chromosomeFitness population
	(setq totalSum (+ totalSum chromosomeFitness))
  )

  ;(princ "Total Sum is ")(princ totalSum)
										;Select n Chromosomes
  (setq i 0)
  (while
	(< i numberOfChromosomes)
	 (progn
										;Generate a Random Number
	   (setq randomNumber (randomFromRange 0 totalSum))
	   (setq sum 0.0)
	   ;(setq sum (nth 0 population))
	   (setq index 0)

	   (setq break 0)
	   ;(princ "Inside while the random no is ")(princ randomNumber)(princ "\n")
	   (while (and (< index (length population)) (= break 0))
		  (if (>= sum randomNumber)
			 (progn
			   ;(princ "In 1st if Index= ")(princ index)(princ "\n")
			   (setq individuals (append individuals (list index)))
			   (setq break 1)
			 )
			 (progn
			   ;(princ "In 2nd if Index= ")(princ index)(princ "\n")
			   
			   (setq sum (+ sum (nth index population)))
			   (setq index (+ index 1))
			 )
		  )
	   )
	   (setq i (+ i 1))
	 )
  )
  (setq answer individuals)
)

										;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

										;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
										;Function for generating random number within a range
(defun randomFromRange (start end)
  (fix (+ start (* (randnum) (- end start))))
)

										;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

										;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
										;Generate a Random Number
(defun randnum (/ modulus multiplier increment random)

  (if (not seed)
	(setq seed (getvar "DATE"))
  )

  (setq	modulus	   65536
		multiplier 25173
		increment  13849
		seed	   (rem (+ (* multiplier seed) increment) modulus)
		random	   (/ seed modulus)
  )
)
										;---------------------------------------------------------------------------------------------------------------------------------------------------------------------