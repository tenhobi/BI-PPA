;let
(defun mocnina2 (n k)
  (if
    (eq k 0)
    1
    (if
      (evenp k)
      (let ((x (mocnina2 n (/ k 2)))) (* x x))
      (let ((x (mocnina2 n (/ (- k 1) 2)))) (* n x x))
    )
  )
)

;lambda
(defun mocnina3 (n k)
  (if
    (eq k 0)
    1
    (if
      (evenp k)
      ((lambda (x) (* x x)) (mocnina3 n (/ k 2)))
      ((lambda (x) (* n x x)) (mocnina3 n (/ (- k 1) 2)))
    )
  )
)

(defun factAcc (n acc)
  (if
    (eq n 0)
    acc
    (factAcc (- n 1) (* n acc))
  ) 
)

(defun fact2 (n)
  (factAcc n 1)
)

;pf = predchozi fib
;ppf = predpredchozi fib
(defun fibAcc (n pf ppf)
  (if (eq n 0)
    pf
    (fibAcc (- n 1) (+ pf pff) pf)
  )
)

(defun fib2 (n)
  (fibAcc n 0 1)
)

(defun pronasobit (a b)
  (if 
    (and (eq a ()) (eq b ()))
    a
    ; a je prazdne
    (if
      (eq a ())
      (cons nil (pronasobit a (cdr b)))
      ; b je prazdne
      (if 
        (eq b ())
        (cons nil (pronasobit (cdr a) b))
        ; jinak
        (cons (* (car a) (car b)) (pronasobit (cdr a) (cdr b)))
      )
    )
  )
)

(defun pronasobit2 (a b)
  (cond 
    (
      (and (eq a ()) (eq b ())) 
      a
    )
    (
      (eq a ())
      (cons nil (pronasobit2 a (cdr b)))
    )
    (
      (eq b ())
      (cons nil (pronasobit2 b (cdr a)))
    )
    (
      (cons (* (car a) (car b)) (pronasobit2 (cdr a) (cdr b)))
    )
  )
)

(defun test (x)
  (cond
    (
      (eq x 0)
      "nula"
    )
    (
      (eq x 1)
      "jedna"
    )
    (
      (eq x 2)
      "dva"
    )
    (
      (eq x 3)
      "tri"
    )
    (
      "prilis velke cislo"
    )
  )
)

(defun obsahuje (x a)
  (if
    (eq a ())
    nil
    (if 
      (eq x (car a))
      t
      (obsahuje x (cdr a))
    )
  )
)

(defun najdi_helper (x a pos)
  (if
    (eq a ())
    nil
    (if
      (eq x (car a))
      pos
      (najdi_helper x (cdr a) (+ pos 1))
    )
  )
)

(defun najdi (x a)
  (najdi_helper x a 0)
)

(defun findAll_helper (x a pos)
  (if
    (eq a ())
    nil
    (if
      (eq x (car a))
      (cons pos (findAll_helper x (cdr a) (+ pos 1)))
      (findAll_helper x (cdr a) (+ pos 1))
    )
  )
)

(defun findAll (x a)
  (findAll_helper x a 0)
)

(defun findAllMax_helper (a best occ pos)
  (if
    (eq a ())
    (cons best occ)
    (if
      (< best (car a))
      (findAllMax_helper (cdr a) (car a) (list pos) (+ pos 1))
      (if 
        (eq best (car a))
        (findAllMax_helper (cdr a) best (cons pos occ) (+ pos 1))
        (findAllMax_helper (cdr a) best occ (+ pos 1))
      )
    )
  )
)

(defun findAllMax_helper (a best occ pos)
  (cond 
    (
      (eq a ())
      (cons occ best)
    )
    (
      (< best (car a))
      (findAllMax_helper (cdr a) (car a) (list pos) (+ pos 1))
    )
    (
      (eq best (car a))
      (findAllMax_helper (cdr a) best (cons pos occ) (+ pos 1))
    )
    (
      (findAllMax_helper (cdr a) best occ (+ pos 1))
    )
  )
)

(defun findAllMax (a)
  (if
    (eq a ())
    nil
    (findAllMax_helper (cdr a) (car a) (list 0) 1)    
  )
)
