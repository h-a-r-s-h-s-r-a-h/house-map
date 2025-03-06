;----------------------------------------------------------------------------------------------------------------------------------------------------------------
;Returns Indexes of Individuals for Mating Population
(defun stochasticUniversalSampling (population n / sum f p rand start individuals index pointer i break)
  (setq sum 0.0)
  (setq f 0.0)

  (foreach segment population
    (setq f (+ f segment))						;Calculate Sum of fitness of each individual of popultion
    )

  (setq p (/ f n))							;Calculate distance between pointer, p = f / n
  (setq rand (randnum))							;Random Number
  (setq start (* rand p))						;Starting Seed of Pointer, start = rand * p

  (setq individuals nil)						;Store Index of Selected Individuals
  (setq index 0)							;Current Index in Population
  
  (setq sum (nth index population))					;Sum = Population[0]

  (setq i 0)
  (while (< i n)
    (setq pointer (+ start (* i p)))					;Determine pointer to a segment in the population

    (if (>= sum pointer)
      (progn								;If Current Sum >= Pointer
	(setq individuals (append individuals (list index)))			;Add Index of Individual to Selected Individuals list
	)
      
      (progn								;Else If Current Sum < Pointer
	(setq index (+ index 1))						;Increment the index
	(setq break 0)								;Variable for checking whether break out of loop or not
	(while (and
		 (< index (- (length population) 1))				;Check if Current Index < (Length of Poulation)-1
		 (= break 0)							;Continue Iteration if Block =0
		 )
	  (setq sum (+ sum (nth index population)))				;Sum = Sum + Population[Index]
	  (if (>= sum pointer)
	    (progn								;If Current Sum >= Pointer
	      (setq individuals (append individuals (list index)))			;Add Index of Individual to Selected Individuals list
	      (setq break 1)								;Break The Loop
	      )
	    )
	  (setq index (+ index 1))					;Increment Index
	  )
	)

      )

    (setq i (+ i 1))							;Increment i
    )
  
  (unique individuals)							;Remove duplicates from selected individuals list
  )
;----------------------------------------------------------------------------------------------------------------------------------------------------------------


;----------------------------------------------------------------------------------------------------------------------------------------------------------------
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
;----------------------------------------------------------------------------------------------------------------------------------------------------------------


;----------------------------------------------------------------------------------------------------------------------------------------------------------------
;Remove Duplicate Elements from List 
(defun unique ( l / x r )
    (while l										;Read each element until end of list is reached
        (setq x (car l)
              l (vl-remove x (cdr l))
              r (cons x r)
        )
    )
    (reverse r)
)
;----------------------------------------------------------------------------------------------------------------------------------------------------------------


;----------------------------------------------------------------------------------------------------------------------------------------------------------------
;Driver Function
;|(defun selection(fitnessPopulation)

  ;(setq SourceFile (open "C:\\Users\\sbad\\Documents\\automated_space_allocation\\fitness.txt" "r"))		;Read Source file

  (setq totalPopulation 0)								;Contains Total Number of Individuals in Population

  (setq fitnessPopulation nil)								;Contains Fitness of Each Individual of Population


  (while (setq SourceFileRead (read-line SourceFile))					;Read individual fitness from SourceFile until EOF is reached
    (setq fitnessPopulation (append fitnessPopulation (list (atoi SourceFileRead))))	;Append each fitness to list while converting String to Int
    (setq totalPopulation (+ totalPopulation 1))					;Increment TotalPopulation counter each time fitness is appended to list
    )

  (close SourceFile)									;Close SourceFile

  (stochasticUniversalSampling fitnessPopulation totalPopulation)			;Returns Mating Population by using Stochastic Universal Sampling
  )
;----------------------------------------------------------------------------------------------------------------------------------------------------------------|;