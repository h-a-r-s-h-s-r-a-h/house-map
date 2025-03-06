;(defvar  *foo* 0)
(defun tex()
  
            (command "._-layer" "_m" "Space" "_c" 10 "" "")
            (command "._pline" (list 0 0) (list 10 0) (list 10 10) (list 0 10) "_c")
	 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

 
 (setq name "heloo")
 ; (princ name)

  (command "text" (list 0 0) 0.500 0 name)
  ;(setq e (entget(entlast)))
  ;(textbox e)
  
  )