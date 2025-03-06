;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

(defun mutation (child / newchild)
 ;(princ "mut")
  
  (setq group_gene nil)
  (setq width_gene nil)
  (setq height_gene nil)
  (setq rand 0)
  (setq rand1 0)
  (setq rand2 0)

  (setq group_child (nth 0 child))
  (setq width_child (nth 1 child))
  (setq height_child(nth 2 child))  
  (setq rand5 0)
  (setq rand5 (fix(* (randnum) 4)))
  (setq group_gene (nth rand5 group_child))
  (setq width_gene (nth rand5 width_child))
  (setq height_gene (nth rand5 height_child))
   (setq rand4 0)
  (setq rand4 (fix(* (randnum) 2)))
  
  (if (= rand4 0)
    (progn
       (setq exchange (nth 0 group_gene))
       (setq group_gene(replace-n (nth 1 group_gene) 0 group_gene))
       (setq group_gene(replace-n exchange 1 group_gene))
   
      (setq exchange (nth 0 width_gene))
       (setq width_gene(replace-n (nth 1 width_gene) 0 width_gene))
       (setq width_gene(replace-n exchange 1 width_gene))
      
      (setq exchange (nth 0 height_gene))
      (setq height_gene(replace-n (nth 1 height_gene) 0 height_gene))
      
       (setq height_gene(replace-n exchange 1 height_gene))

      
  )
    (progn
       (setq exchange (nth 2 group_gene))
       (setq group_gene(replace-n (nth 3 group_gene) 2 group_gene))
       (setq group_gene(replace-n exchange 3 group_gene))
  
      (setq exchange (nth 2 width_gene))
       (setq width_gene(replace-n (nth 3 width_gene) 2 width_gene))
       (setq width_gene(replace-n exchange 3 width_gene))
      
      (setq exchange (nth 2 height_gene))
      (setq height_gene(replace-n (nth 3 height_gene) 2 height_gene))
     
       (setq height_gene(replace-n exchange 3 height_gene))
     
      
  )
    )
 
 
  (setq group_child (replace-n group_gene rand5 group_child))
   (setq width_child (replace-n width_gene rand5 width_child))
   (setq height_child (replace-n height_gene rand5 height_child))
 (setq rand (fix(* (randnum) 4)))
  (if (< rand 2)
    (progn
   (setq rand1 0)
   (setq rand2 1)
   )
   (progn
      (setq rand1 2)
   (setq rand2 3)
     )
    )
  (setq group_gene (nth rand1 group_child))
  (setq width_gene (nth rand1 width_child))
  (setq height_gene (nth rand1 height_child))
  (setq group_gene1 (nth rand2 group_child))
  (setq width_gene1 (nth rand2 width_child))
  (setq height_gene1 (nth rand2 height_child))

  
  (setq rand3 0)
  (setq rand3 (fix(* (randnum) 2)))
  (if (= rand3 0)
    (progn
    (setq exchange (nth 0 group_gene))
    (setq exchange1 (nth 1 group_gene))
    (setq group_gene (replace-n (nth 2 group_gene1) 0 group_gene))
     (setq group_gene (replace-n (nth 3 group_gene1) 1 group_gene))
      (setq group_gene1 (replace-n exchange 2 group_gene1))
     (setq group_gene1 (replace-n exchange1 3 group_gene1))
     (setq exchange (nth 0 width_gene))
    (setq exchange1 (nth 1 width_gene))
    (setq width_gene (replace-n (nth 2 width_gene1) 0 width_gene))
     (setq width_gene (replace-n (nth 3 width_gene1) 1 width_gene))
      (setq width_gene1 (replace-n exchange 2 width_gene1))
     (setq width_gene1 (replace-n exchange1 3 width_gene1))
    (setq exchange (nth 0 height_gene))
    (setq exchange1 (nth 1 height_gene))
    (setq height_gene (replace-n (nth 2 height_gene1) 0 height_gene))
     (setq height_gene (replace-n (nth 3 height_gene1) 1 height_gene))
      (setq height_gene1 (replace-n exchange 2 height_gene1))
     (setq height_gene1 (replace-n exchange1 3 height_gene1))
    )
(progn
    (setq exchange (nth 2 group_gene))
    (setq exchange1 (nth 3 group_gene))
    (setq group_gene (replace-n (nth 0 group_gene1) 2 group_gene))
     (setq group_gene (replace-n (nth 1 group_gene1) 3 group_gene))
      (setq group_gene1 (replace-n exchange 0 group_gene1))
     (setq group_gene1 (replace-n exchange1 1 group_gene1))
     (setq exchange (nth 2 width_gene))
    (setq exchange1 (nth 3 width_gene))
    (setq width_gene (replace-n (nth 0 width_gene1) 2 width_gene))
     (setq width_gene (replace-n (nth 1 width_gene1) 3 width_gene))
      (setq width_gene1 (replace-n exchange 0 width_gene1))
     (setq width_gene1 (replace-n exchange1 1 width_gene1))
    (setq exchange (nth 2 height_gene))
    (setq exchange1 (nth 3 height_gene))
    (setq height_gene (replace-n (nth 0 height_gene1) 2 height_gene))
     (setq height_gene (replace-n (nth 1 height_gene1) 3 height_gene))
      (setq height_gene1 (replace-n exchange 0 height_gene1))
     (setq height_gene1 (replace-n exchange1 1 height_gene1))
    )
    )

(if (< rand 2)
    (progn
    (setq group_child (replace-n group_gene 0 group_child))
    (setq group_child (replace-n group_gene1 1 group_child))
     (setq width_child (replace-n width_gene 0 width_child))
    (setq width_child (replace-n width_gene1 1 width_child))
     (setq height_child (replace-n height_gene 0 height_child))
    (setq height_child (replace-n height_gene1 1 height_child))
   )
   (progn
      (setq group_child (replace-n group_gene 2 group_child))
    (setq group_child (replace-n group_gene1 3 group_child))
      (setq width_child (replace-n width_gene 2 width_child))
    (setq width_child (replace-n width_gene1 3 width_child))
     (setq height_child (replace-n height_gene 2 height_child))
    (setq height_child (replace-n height_gene1 3 height_child))
     )
    )



  (setq newchild (list group_child width_child height_child))
  newchild

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