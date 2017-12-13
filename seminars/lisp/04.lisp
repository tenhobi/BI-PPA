(defun bubbleSort (l &optional (c '<))
  (bubbleSortHelper l (pocetAtomu l) c)
)

(defun bubbleSortHelper (l p c)
  (if 
    (eq p 0)
    l
    (bubbleSortHelper (bubble l c) (- p 1) c)
  )
)

(defun bubble (l c)
  (if 
    (eq l ())
    nil
    (if 
      (eq (cdr l) ())
      (cons (car l) '())
        (if
          (funcall c (car l) (cadr l))
          (cons (car l) (bubble (cons (cadr l) (cddr l)) c))
          (cons (cadr l) (bubble (cons (car l) (cddr l)) c))
        )
      
    )
  )
)

(defun pocetAtomu (a)
  (if 
    (eq a ())
    0
    (if 
      (atom (car a))
      (+ 1 (pocetAtomu (cdr a)))
      (+ (pocetAtomu (car a)) (pocetAtomu (cdr a)))
    )
  )
)








(defun secondMin (l)
  (car (vymaz (car (bubbleSort l '<)) (bubbleSort l '<)))
)

(defun vymaz (x l)
  (if 
    (eq l ())
    nil
    (if 
      (eq x (car l))
      (vymaz x (cdr l))
      (cons (car l) (vymaz x (cdr l)))
    )
  )
)








(defun vymazSafe (x l)
  (if 
    (eq l ())
    nil
    (if 
      (eq x (car l))
      (cdr l)
      (cons (car l) (vymazSafe x (cdr l)))
    )
  )
)

(defun nejmensi (l &optional (c '<))
  (if 
    (eq l ())
    nil
    (if
      (eq (cdr l) ())
      (car l) 
      (if 
        (funcall c (car l) (nejmensi (cdr l) c))
        (car l)
        (nejmensi (cdr l) c)
      )
    )
  )
)

(defun selectSort (l &optional (c '<))
  (selectSortHelper l (pocetAtomu l) c)
)

(defun selectSortHelper (l p c)
  (if 
    (eq p 0)
    l
    (cons 
      (nejmensi l c) 
      (selectSortHelper (vymazSafe (nejmensi l c) l) (- p 1) c)
    )
  )
)

