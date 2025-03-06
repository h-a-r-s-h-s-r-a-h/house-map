(defun selectTopElements (fitnessPopulation numberOfElements / maxElements)
  (setq maxElements nil)
  (setq indexList nil)
  (setq i 0)
 
    (if (> (length fitnessPopulation) numberOfElements)
	   
	  (progn
		(while (< i numberofElements)
	    (setq index (vl-position (apply 'max fitnessPopulation) fitnessPopulation))
	    (setq indexList (append indexList (list index)))
	    (setq fitnessPopulation (replace-n 0 index fitnessPopulation))
	    (setq i (+ i 1))
        )
	  )
	  (progn
		(while (< i (length fitnessPopulation))
	    (setq index (vl-position (apply 'max fitnessPopulation) fitnessPopulation))
	    (setq indexList (append indexList (list index)))
	    (setq fitnessPopulation (replace-n 0 index fitnessPopulation))
	    (setq i (+ i 1))
        )

	  )
	)
  (setq answer indexList)
  )