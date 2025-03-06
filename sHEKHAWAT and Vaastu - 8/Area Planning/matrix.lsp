(defun matrix (/ arr16)
                ;|   NE    |     NW        |        SW      |    SE          |;
                ;  E    W      E       W        E       W       E       W         
  (setq	arr16
		 '(
;|1 bedroom    |; (0	0	0	0	9	10	0	0)
;|2 latrine    |; (0	0	5	10	0	0	0	0)
;|4 kitchen|;     (0	0	0	0	0	0	10	2)
;|5 dining|;      (0	0	0	0	0	0	5	10)
;|7 std1|;        (0	9	10	0	0	0	0	0)
;|8 verandah|;    (5	10	0	0	0	0	4	0)
;|10 draw|;       (0	9	0	0	0	0	10	0)
;|12 guest|;      (0	9	8	8	5	0	0	0)

		  )
  )
  arr16
  )
(defun matrix1 (/ arr16)
                ;   1    2      4       5       7       8      10      12   
  (setq	arr16
		 '(
;|1 bedroom    |; (0	8	7	7	9	9	7	9)
;|2 latrine    |; (8	0	9	9	9	9	9	9)
;|4 kitchen|;     (0	0	0	10	2	8	7	0)
;|5 dining|;      (9	0	10	0	7	6	7	2)
;|7 std1|;        (2	8	2	2	0	10	6	8)
;|8 varndah|;     (4	5	8	8	9	0	9	5)
;|10 draw|;       (6	2	7	7	7	9	0	4)
;|12 guest|;      (7	9	8	8	10	10	8	0)

		  )
  )
  arr16
  )






