

				                 (if (and (>= (+ space_x space_len) xi) (>= (+ space_y space_hgt) yi))
						       (progn
							      (if (> (+ space_x space_len) 10)
								 (setq xx (- (+ space_x space_len) 3))
								)
							      (if (> (+ space_x space_len) 8)
								 (setq xx (- (+ space_x space_len) 2))
								)
						               (if (> (+ space_x space_len) 5)
								 (setq xx (- (+ space_x space_len) 1))
							  	)
							      (if (> (+ space_y space_hgt) 10)
								 (setq yy (- (+ space_hgt space_hgt) 3))
								)
							      (if (> (+ space_y space_hgt) 8)
								 (setq yy (- (+ space_y space_hgt) 2))
								)
						               (if (> (+ space_y space_hgt) 5)
								 (setq yy (- (+ space_y space_hgt) 1))
								)
							 (setq p 0) (princ "yi==> 444444====")
						       (foreach membr lis
							    (if (and (> (nth 0 lis) xx) (< (nth 1 lis) yy))
						             (progn (setq p 1)
							      )
							     )
							 )
							 (setq pii 0)
							 (foreach membr lis
							    (if (and (< (nth 0 lis) xx) (> (nth 1 lis) yy))
						             (progn (setq pii 1)
							      )
							     )
							 )
							(if (= p 0) 
							  (progn
							     (if (<= yy yi)
							       (progn
                                                     (setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
  
		                                                         (setq pt1 (list space_x space_y))
		                                                         (setq pt2 (list xx space_y))
	                                                                 (setq pt3 (list xx yy))
	                                                                 (setq pt4 (list space_x yy))
									   (if (> xx max_len)
					       (setq max_len xx)
					    )
					  (if (> yy max_hgt)
					       (setq max_hgt yy)
					    )
									  (setq temp_lis nil)
					  (foreach ele_lis lis
                                                       (setq a (nth 0 ele_lis ))
                                                       (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					)
					(setq lis temp_lis)
					 (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (< b yy))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
					  (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a xx) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
									(command "._pline" pt1 pt2 pt3 pt4 "_c")

  
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

  (setq name (cdr (assoc "name" (eval (read space_name)))))
 

  (command "-MTEXT" pt1 pt4 name "")
									  (setq lis (cons (list space_x yy) lis))
					                                (setq lis (cons (list xx space_y) lis))
		                                                       
						 (setq ad 0)
					 
					 (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a xx) (= b 0))
						         (setq ad 1)
						      )
					)
					 (if (= ad 1)
						       
                                              (setq lis (append lis (list (list xx 0))))
					    
					    )
					 
					; (setq lis temp_lis)
					(setq ad 0)
					  (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a 0) (< b yy))
						         (setq ad 1)
						      )
					    )
					 (if (= ad 1)
						         (setq lis (append lis (list (list 0 yy))))
						       

					    
					    )
									  (setq tem nil)
  (setq io 0)
  (while (< io (length lis))
    (setq ao (nth io lis))
    (setq jo (+ io 1))
  (setq te 0)
  (while (< jo (length lis))
      (setq bo (nth jo lis))
      (if (equal ao bo)
	  (setq te 1)
	)
    (setq jo (+ jo 1))
    )
	(if (= te 0)
	  (setq tem (append tem(list ao)))
	  )
    (setq io (+ io 1))
  )
  (setq lis tem)
									 
                                                                         (setq  lis (vl-sort lis '(lambda (e1 e2) (< (cadr e1) (cadr e2)))))
                                                                         (setq lis (vl-sort lis '(lambda (e1 e2) (< (car e1) (car e2)))))
                                                                        ; (vl-remove '(space_x space_y) lis)
									 (setq j (length lis))
									 (setq m (length lis))
		                                                        )
							 )
						   )

                                            )
							 (if (= pii 0) 
							  (progn
							     (if (<= xx xi)
							       (progn
                                                     (setvar "cmdecho" 0)
   
                                                                         (command "._-layer" "_m" "Space" "_c" 10 "" "")
  
		                                                         (setq pt1 (list space_x space_y))
		                                                         (setq pt2 (list xx space_y))
	                                                                 (setq pt3 (list xx yy))
	                                                                 (setq pt4 (list space_x yy))
									   (if (> xx max_len)
					       (setq max_len xx)
					    )
					  (if (> yy max_hgt)
					       (setq max_hgt yy)
					    )
									  (setq temp_lis nil)
					  (foreach ele_lis lis
                                                       (setq a (nth 0 ele_lis ))
                                                       (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					)
					(setq lis temp_lis)
					 (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a space_x) (< b yy))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
					  (setq temp_lis nil)
					   (foreach ele_lis lis
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a xx) (= b space_y))
						         (setq temp_lis temp_lis)
						         (setq temp_lis (append temp_lis (list ele_lis)))
						       

					    )
					    )
					  (setq lis temp_lis)
									(command "._pline" pt1 pt2 pt3 pt4 "_c")

  
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

  (setq name (cdr (assoc "name" (eval (read space_name)))))
 

  (command "-MTEXT" pt1 pt4 name "")
									  (setq lis (cons (list space_x yy) lis))
					                                (setq lis (cons (list xx space_y) lis))
		                                                       
						 (setq ad 0)
					 
					 (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (< a xx) (= b 0))
						         (setq ad 1)
						      )
					)
					 (if (= ad 1)
						       
                                              (setq lis (append lis (list (list xx 0))))
					    
					    )
					 
					; (setq lis temp_lis)
					(setq ad 0)
					  (foreach ele_lis lis                                                     ;if two points are (12,0) and (12,11) in lis then remove (12,11)
                                                    (setq a (nth 0 ele_lis ))
                                                   (setq b (nth 1 ele_lis ))
                                                    (if (and (= a 0) (< b yy))
						         (setq ad 1)
						      )
					    )
					 (if (= ad 1)
						         (setq lis (append lis (list (list 0 yy))))
						       

					    
					    )
									  (setq tem nil)
  (setq io 0)
  (while (< io (length lis))
    (setq ao (nth io lis))
    (setq jo (+ io 1))
  (setq te 0)
  (while (< jo (length lis))
      (setq bo (nth jo lis))
      (if (equal ao bo)
	  (setq te 1)
	)
    (setq jo (+ jo 1))
    )
	(if (= te 0)
	  (setq tem (append tem(list ao)))
	  )
    (setq io (+ io 1))
  )
  (setq lis tem)
									 
                                                                         (setq  lis (vl-sort lis '(lambda (e1 e2) (< (cadr e1) (cadr e2)))))
                                                                         (setq lis (vl-sort lis '(lambda (e1 e2) (< (car e1) (car e2)))))
                                                                        ; (vl-remove '(space_x space_y) lis)
									 (setq j (length lis))
									 (setq m (length lis))
		                                                        )
							 )
						   )

                                            )
							 


					     )
					            
							      )
							 