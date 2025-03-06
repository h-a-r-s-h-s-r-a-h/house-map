(defun data_gen	(/ var f)
  (setq var 100)


  (if (setq file (open "C:\\Users\\sbad\\Desktop\\data_dump2.json" "w"))

    (progn

      (princ "{\n" file)
      (while (<= var 300)
	(initiateGA var file)
	(setq var (+ var 1))
      )
      (princ "}\n" file)
      (close file)

    )

    (princ "\n Error - File was not opened.")



  )
)