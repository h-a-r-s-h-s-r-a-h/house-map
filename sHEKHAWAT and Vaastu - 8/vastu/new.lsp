CL-USER>

(defun sb-thread:make-thread()
  (lambda ()
    (progn
      (sleep 0)
      (setf c (+ a b))
      (print "ADDITION")
      (print c))))
  