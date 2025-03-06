(defun grpprox (ith group_gg checked / fe)
  (setq	arr16 (matrix1))
	;|	 '(
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
    (setq i1 0)
    (setq vlist nil)
    (setq flist nil)
  
    (while (< i1 (length group_gg))
             (setq p 0)
             (setq z (nth i1 group_gg))
                    (setq vlist nil)
            ; (princ "\n")(princ "cross6")
             (foreach eel checked
              (if (equal eel z)
                    (setq p 1)
               )
	       )

              ;  (princ "\n")(princ "cross7")
               (if (= p 1)
		(progn
	       ;(setq flist flist)
		  (setq i1 (+ i1 1))
	       )
		(progn
		            (setq gnum i1)
		  ; (princ "\n")(princ "cross8")
		           (foreach ee j
			       (setq elist nil)
			       (foreach eo z
				    (setq elist(append elist(list (list ee (nth eo (nth ee arr16)) ))))
				 )
			             (setq  elist (vl-sort elist '(lambda (e1 e2) (> (cadr e1) (cadr e2)))))
                                    (setq vlist(append vlist(list (nth 0 elist) )))
	                    )
		    (setq checked (append checked(list z)))
	       ; (princ "\n")(princ "cross9")
           (setq  vlist (vl-sort vlist '(lambda (e1 e2) (> (cadr e1) (cadr e2)))))
		  (setq me (nth 1 (nth 0 vlist)))
	       (setq flist (append flist (list (list gnum me))))

               (setq i1 (+ i1 1))
		  )
	      )
       ;(princ "\n")(princ "cross10")
     
    )
 ; (while pe)
   ;(princ "\n")(princ "cross11")
 (setq  flist (vl-sort flist '(lambda (e1 e2) (> (cadr e1) (cadr e2)))))
  ;(princ flist)
  ;(princ "\n")(princ "cross12")
  
  (setq fe (nth 0 (nth 0 flist)))
  ;(setq maxpro (nth 0 (nth 0 vlist)))

  
  
)