
(setq room0 (list '("area" . 5) '("name" . "Room 0")))

(setq room1 (list '("area" . 5) '("name" . "BedRoom 1")))

(setq room2 (list '("area" . 8) '("name" . "BedRoom 2")))

(setq room3 (list '("area" . 8) '("name" . "Bathroom1")))

(setq room4 (list '("area" . 10) '("name" . "Kitchen")))

(setq room5 (list '("area" . 10) '("name" . "DiningRoom")))

(setq room6 (list '("area" . 10) '("name" . "Library")))

(setq room7 (list '("area" . 10) '("name" . "StudyRoom1")))

(setq room8 (list '("area" . 10) '("name" . "StudyRoom2")))

(setq room9 (list '("area" . 12) '("name" . "Bathroom2")))

(setq room10 (list '("area" . 12) '("name" . "Drawing Room")))

(setq room11 (list '("area" . 13) '("name" . "Room 11")))

(setq room12 (list '("area" . 14) '("name" . "Room 12")))

(setq room13 (list '("area" . 15) '("name" . "Room 13")))

(setq room14 (list '("area" . 18) '("name" . "Room 14")))

(setq room15 (list '("area" . 18) '("name" . "Room 15")))




;|
(setq group6 (list room1 room7))
(setq group7 (list room8 room9))
(setq group8 (list room10 room12 room13 room14))
(setq group9 (list room3 room4 room5 room6))
(setq group10 (list room2 room11 room15))

(setq group1 (list room1 room3 room5))
(setq group2 (list room2 room4 room6))
(setq group3 (list room15 room7 room8))
(setq group4 (list room9 room10 room12))
(setq group5 (list room11 room13 room14 room16))



										; Making a group of spaces

(setq chromosome1 (list group1 group2 group3 group4 group5))
(setq chromosome2 (list group6 group7 group8 group9 group10))

(setq groups (list chromosome1 chromosome2))
|;


(setq groups (newGA))

										; Helper Method to calculate lenght and height of a space

(defun calc_len_hgt	(space)

										; Getting Area of the Space

  ;(setq area (cdr (assoc "area" space)))
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))
		 
  (setq area (cdr (assoc "area" (eval (read space_name)))))
			
		    ;(setq name (cdr (assoc "name" (eval (read space_name)))))

										;Calculating Height and Length in case of unqual areas

;  (setq hgt (sqrt (/ area 1.6)))
;  (setq len (* hgt 1.6))

  ;IN case of equal areas

  (setq hgt (sqrt area))
  (setq len hgt)
  

										;Creating a list for storing dimensions and returning them 
  (setq dims (list len hgt))

										; Returns the list "dims" which stores length and height 
  dims

)										; end of calc_len_hgt


										;drawing rectangle with bottom left corner and length and height
(defun drawrectangle (space space_x space_y rect_length rect_height i)

  (setvar "cmdecho" 0)
  (command "._-layer" "_m" "Space" "_c" 10 "" "")

  (setq pt1 (list space_x space_y))

  (if (= (rem i 4) 0)

	(progn

	  (setq pt2 (list (- space_x rect_length) space_y))
	  (setq
		pt3	(list (- space_x rect_length) (+ space_y rect_height))
	  )
	  (setq pt4 (list space_x (+ space_y rect_height)))


	)

  )

  (if (= (rem i 4) 1)

	(progn

	  (setq pt2 (list (+ space_x rect_length) space_y))
	  (setq
		pt3	(list (+ space_x rect_length) (+ space_y rect_height))
	  )
	  (setq pt4 (list space_x (+ space_y rect_height)))

	)

  )

  (if (= (rem i 4) 2)

	(progn

	  (setq pt2 (list (+ space_x rect_length) space_y))
	  (setq
		pt3	(list (+ space_x rect_length) (- space_y rect_height))
	  )
	  (setq pt4 (list space_x (- space_y rect_height)))


	)

  )

  (if (= (rem i 4) 3)

	(progn

	  (setq pt2 (list space_x (- space_y rect_height)))
	  (setq
		pt3	(list (- space_x rect_length) (- space_y rect_height))
	  )
	  (setq pt4 (list (- space_x rect_length) space_y))



	)

  )




  (command "._pline" pt1 pt2 pt3 pt4 "_c")

  
  (setq space_string (vl-princ-to-string space))
  (setq space_name (strcat "ROOM" space_string))
		 
  ;(setq area (cdr (assoc "area" (eval (read space_name)))))

  (setq name (cdr (assoc "name" (eval (read space_name)))))
 

  (command "-MTEXT" pt1 pt4 name "")


)

										;end of drawrectangle


										;method for drawing extra space

(defun draw_extra_space	(ex ey el eh)



  (command "._layer" "_m" "Extra_Space" "_c" 2 "" "")

  (setq e_pt1 (list ex ey))
  (setq e_pt2 (list (+ ex el) ey))
  (setq
	e_pt3 (list (+ ex el) (- ey eh))
  )
  (setq e_pt4 (list ex (- ey eh)))


  (command "._pline" e_pt1 e_pt2 e_pt3 e_pt4 "_c")
  ;(command "_.MTEXT" e_pt1 e_pt4 "Room Extra" "")


)

										;end of draw extra space


(defun c:drawrect (/ old_osmode pt1 pt2 pt3 pt4)


 
  (setq old_osmode (getvar "osmode"))
  (setvar "osmode" 0)
  (setvar "cmdecho" 0)

										;creating a layer called Space and then drawing on it





										; Calculating Space's height and width and storing in its assoc list
										;(modify_assoc)



  
  (setq iteration 0)

  (foreach chromosome groups
   (setq group_count 1)
	
	(foreach group chromosome

										; Setting the initial value for the rectangle

	  (setq el 0)
	  (setq eh 0)


	  (setq ex 0)
	  (setq ey 0)

	  (setq rh 0)
	  (setq rl 0)

	  (setq rx 0)
	  (setq ry 0)

	  (setq prev_space_length 0)


	  (if (= group_count 1)
		(progn
		  (setq space_x (+ (* 100 iteration) 30))
		  (setq space_y 15)
		)
	  )

	  (if (= group_count 2)
		(progn
		  (setq space_x (+ (* 100 iteration) 30))
		  (setq space_y 50)
		)
	  )

	  (if (= group_count 3)
		(progn
		  (setq space_x (+ (* 100 iteration) 30))
		  (setq space_y 30)
		)
	  )

	  (if (= group_count 4)
		(progn
		  (setq space_x (+ (* 100 iteration) 10))
		  (setq space_y 30)
		)
	  )

	  (if (= group_count 5)
		(progn
		  (setq space_x (+ (* 100 iteration) 50))
		  (setq space_y 30)
		)
	  )

	 

	  ; drawing every space in one group

	  (setq i 0)

	  (foreach space group

	
										; Getting space's height and length from the assoc list

		(setq dims (calc_len_hgt space))

		(setq space_length (nth 0 dims))

		(setq space_height (nth 1 dims))




										; Calculating the co-ordinates of the rectangle


		(if	(or (= i 0) (= i 1))
		  (progn
			(if	(= i 1)
			  (setq space_y (cadr (getvar "LASTPOINT")))

			)


			(setq pt1 (list space_x space_y))
			(setq pt2 (list (+ space_x space_length) space_y))
			(setq
			  pt3
			   (list (+ space_x space_length) (+ space_y space_height))
			)
			(setq pt4 (list space_x (+ space_y space_height)))

			(command "._layer" "_m" "Space" "_c" 10 "" "")

			(command "._line" pt1 pt2 pt3 pt4 "_c")


			(setq space_string (vl-princ-to-string space))
		    (setq space_name (strcat "ROOM" space_string))
		 
		    ;(setq area (cdr (assoc "area" (eval (read space_name)))))
			
		    (setq name (cdr (assoc "name" (eval (read space_name)))))

		   

		   (command "-MTEXT" pt1 pt3 name "")

			(setq rl (max rl space_length))
			(setq rh (+ rh space_height))

			(setq rx space_x)
			(setq ry space_y)

										;Start of creating extra space

			(if	(= i 1)
			  (progn

				(if	(> prev_space_length space_length)

				  (progn

					(setq el (- rl space_length))
					(setq eh (- rh prev_space_height))

					(setq ex (+ rx space_length))
					(setq ey (+ ry space_height))



				  )

										;else if space_length > prev_space_length

				  (progn

					(setq el (- rl prev_space_length))
					(setq eh (- rh space_height))

					(setq ex (+ rx prev_space_length))
					(setq ey ry)




				  )

				)



				(draw_extra_space ex ey el eh)

			  )							;end of extra space if
			)

										; end of if progn
		  )


										;Starting of else for (i=0 or 1)

		  (progn

			;	(princ "In else")
										;(setq space_y (+ (cadr (getvar "LASTPOINT")) space_height))


			(if	(= (rem i 4) 1)

			  (progn


				(setq space_x (- rx prev_space_length))
				(setq space_y (+ ry rh))


										;drawing second space

				(drawrectangle
				  space space_x space_y space_length space_height	i)


				(setq rx space_x)
				(setq ry space_y)

										;drawing of extra space started

				(if	(< space_length rl)

				  (progn

					(setq el (- rl space_length))
					(setq eh space_height)

					(setq ey (+ ry space_height))
					(setq ex (+ rx space_length))


			;		(princ "Space length < rl mod1 ")

			;		(princ el)

				  )						;end of progn

										;start of else if space height > rh

				  (progn
			;		(princ "Space length > rl mod1")
					(setq el (- space_length rl))
					(setq eh rh)

					(setq ey ry)
					(setq ex (+ rx rl))
			;		(princ el)

				  )


				)						;end of if

				(draw_extra_space ex ey el eh)

										;end of extra space

				(setq rh (+ rh space_height))
				(setq rl (max rl space_length))

			  )							;end of progn

			)


			(if	(= (rem i 4) 2)

			  (progn

				(setq space_x (+ rx rl))
				(setq space_y (+ ry prev_space_height))



										;drawing third space

				(drawrectangle
				  space space_x space_y space_length space_height	i)



				(setq rx space_x)
				(setq ry space_y)

										;drawing of extra space started

				(if	(< space_height rh)

				  (progn

					(setq el space_length)
					(setq eh (- rh space_height))

					(setq ey (- ry space_height))
					(setq ex rx)


										; (princ "Space height < rh")

										;(princ el)

				  )						;end of progn

										;start of else if space height > rh

				  (progn
										;(princ "Space height > rh")
					(setq el rl)
					(setq eh (- space_height rh))

					(setq ey (- ry rh))
					(setq ex (- rx rl))
										; (princ el)

				  )


				)						;end of if

				(draw_extra_space ex ey el eh)

										;end of extra space

				(setq rh (max rh space_height))
				(setq rl (+ rl space_length))
			  )

			)

			(if	(= (rem i 4) 3)

			  (progn

				(setq space_x (+ rx prev_space_length))
				(setq space_y (- ry rh))



										;drawing third space

				(drawrectangle
				  space space_x space_y space_length space_height	i)



				(setq rx space_x)
				(setq ry space_y)


										;drawing of extra space started

				(if	(< space_length rl)

				  (progn

					(setq el (- rl space_length))
					(setq eh space_height)

					(setq ey ry)
					(setq ex (- rx rl))


										; (princ "Space length < rl mod3 ")

										; (princ el)

				  )						;end of progn

										;start of else if space height > rh

				  (progn
										; (princ "Space length > rl mod3")
					(setq el (- space_length rl))
					(setq eh rh)

					(setq ey (+ ry rh))
					(setq ex (- rx space_length))
										; (princ el)

				  )


				)						;end of if

				(draw_extra_space ex ey el eh)

										;end of extra space

				(setq rh (+ rh space_height))
				(setq rl (max rl space_length))
			  )
			)

			(if	(= (rem i 4) 0)

			  (progn
				(setq space_x (- rx rl))
				(setq space_y (- ry prev_space_height))

				(drawrectangle
				  space space_x space_y space_length space_height	i)

				(setq rx space_x)
				(setq ry space_y)

										;drawing of extra space started

				(if	(< space_height rh)

				  (progn

					(setq el space_length)
					(setq eh (- rh space_height))

					(setq ey (+ ry rh))
					(setq ex (- rx space_length))


										; (princ "Space height < rh")

										; (princ el)

				  )						;end of progn

										;start of else if space height > rh

				  (progn
										; (princ "Space height > rh")
					(setq el rl)
					(setq eh (- space_height rh))

					(setq ey (+ ry space_height))
					(setq ex rx)
										; (princ el)

				  )


				)						;end of if

				(draw_extra_space ex ey el eh)

										;end of extra space


				(setq rh (max rh space_height))
				(setq rl (+ rl space_length))
			  )

			)
		  )
										;end of else
		)								; end of if


		(setq prev_space_length space_length)
		(setq prev_space_height space_height)


		(setq i (+ i 1))

	  )									; end of for each for spaces

	  (setq group_count (+ group_count 1))


	)									;end of external foreach for groups
     (setq iteration (+ iteration 1))
  )										;end of external for each for groups
  (setvar "osmode" old_osmode)

)										;end of drawspace function