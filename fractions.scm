(define (rat-to-cf r) 
  (let* ((ipart (floor r))
	 (fpart (- r ipart)))
    (if (= fpart 0) (list ipart)
	(append (list ipart) (rat-to-cf (/ fpart))))))

(define (dec-to-cf d)
  (let ((rep (rat-to-cf (rationalize (inexact->exact d) 0))))
    (append (list (car rep) (list (cdr rep))))))

(define (continued-fraction frep)
  (if (null (cdr frep)) (/ (car frep))
      (+ (car frep) (/ (continued-fraction (cdr frep))))))



