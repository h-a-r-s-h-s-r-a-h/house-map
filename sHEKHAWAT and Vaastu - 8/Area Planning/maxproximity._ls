(defun maxprox (ith group_n checked / maxpro)
  (setq	arr16 (matrix))
	;|	'(
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
    (setq j ith)
    (setq i 0)
    (setq vlist nil)
  
    
    (while (< i (length group_n))
             (setq p 0)
             (setq z (nth i group_n))
             (foreach eel checked
              (if (equal eel z)
                    (setq p 1)
               )
	       )


               (if (= p 1)
		(progn
	       (setq vlist vlist)
	       )
		(progn 
             (setq vlist(append vlist(list (list z (nth z (nth j arr16)) ))))
              
	     )
	     )
	       
      (setq i (+ i 1))
    )
  (setq  vlist (vl-sort vlist '(lambda (e1 e2) (> (cadr e1) (cadr e2)))))
  ;(princ vlist)
  (setq maxpro (nth 0 (nth 0 vlist)))
maxpro
)