;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

(defun mutation (child / firstRandomGroupNumber secondRandomGroupNumber firstRandomGroup secondRandomGroup firstRandomElementNumber)

  (setq firstRandomGroupNumber 0)
  (setq secondRandomGroupNumber 0)
  
  (while
    (= firstRandomGroupNumber secondRandomGroupNumber)
    (setq firstRandomGroupNumber (randomFromRange 0 (length child)))
    (setq secondRandomGroupNumber (randomFromRange 0 (length child)))
    )

  (setq firstRandomGroup (nth firstRandomGroupNumber child))
  (setq secondRandomGroup (nth secondRandomGroupNumber child))

  (setq firstRandomElementNumber (randomFromRange 0 (length firstRandomGroup)))
  (setq secondRandomElementNumber (randomFromRange 0 (length secondRandomGroup)))

  (setq temp (nth firstRandomElementNumber firstRandomGroup))
  (setq firstRandomGroup (replace-n (nth secondRandomElementNumber secondRandomGroup) firstRandomElementNumber firstRandomGroup))
  (setq secondRandomGroup (replace-n temp secondRandomElementNumber secondRandomGroup))

  (setq child (replace-n firstRandomGroup firstRandomGroupNumber child))
  (setq child (replace-n secondRandomGroup secondRandomGroupNumber child))

  (setq answer child)
  
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
;Replace an element in list
(defun replace-n (new n lst / )
  (mapcar '(lambda (a) (if (= (setq n (1- n)) -1) new a)) lst)
  )

;---------------------------------------------------------------------------------------------------------------------------------------------------------------------