(defun inversion (child / newchild)
  ;(princ "inv")
   (setq group_child (nth 0 child))
  (setq width_child (nth 1 child))
  (setq height_child(nth 2 child))
  (setq rand (fix(* (randnum) 4)))
  ;(princ rand)
 ; (setq group_gene (nth rand group_child))
  (setq width_gene (nth rand width_child))
  (setq height_gene (nth rand height_child))
  (setq rand1 (fix(* (randnum) 4)))
  ;(princ rand1)
  (setq widthallele (nth rand1 width_gene))
  (setq temp widthallele)
  (setq heightallele (nth rand1 height_gene))
  (setq widthallele heightallele)
  (setq heightallele temp)
   (setq newwidthgene nil)
  (setq i 0)
  (while (< i (length width_child))
      (if (= i rand1)
	(setq newwidthgene(append newwidthgene (list widthallele)))
	(setq newwidthgene(append newwidthgene (list (nth i width_gene))))
	)
    (setq i (+ i 1))
    )
  (setq newheightgene nil)
  (setq i 0)
  (while (< i (length width_child))
      (if (= i rand1)
	(setq newheightgene(append newheightgene (list heightallele)))
	(setq newheightgene(append newheightgene (list (nth i height_gene))))
    )
    (setq i (+ i 1))
    )
     (setq newwidthchild nil)
  (setq i 0)
  (while (< i (length width_child))
      (if (= i rand)
	(setq newwidthchild(append newwidthchild (list newwidthgene)))
	(setq newwidthchild(append newwidthchild (list (nth i width_child))))
	)
    (setq i (+ i 1))
    )
  
  (setq newheightchild nil)
  (setq i 0)
  (while (< i (length height_child))
      (if (= i rand)
	(setq newheightchild(append newheightchild (list newheightgene)))
	(setq newheightchild(append newheightchild (list (nth i height_child))))
	)
    (setq i (+ i 1))
    )
    (setq newchild (list group_child newwidthchild newheightchild))
    newchild
    )