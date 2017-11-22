(defun soucet (x y)
  (if 
    (eq y 0)
    x
    (+ (soucet x (- y 1)) 1)
  )
)

(defun rozdil (x y)
  (if 
    (eq y 0)
    x
    (- (rozdil x (- y 1)) 1)
  )
)

(defun soucin (x y)
  (if 
    (eq y 0)
    0
    (soucet x (soucin x (- y 1)))
  )
)

(defun ctverec (x)
  (soucin x x)
)

(defun mocnina (n k)
  (if 
    (eq k 0)
    1
    (soucin n (mocnina n (- k 1)))
  )
)

(defun podil (x y)
  (if 
    (eq y 0)
    nil
    (if 
      (< x y)
      0
      (+ 1 (podil (- x y) y))
    )
  )
)

(defun modulo (x y)
  (if 
    (eq y 0)
    nil
    (if 
      (< x y)
      x
      (modulo (- x y) y)
    )
  ) 
)

(defun delka (a)
  (if 
    (eq a ())
    0
    (+ 1 (delka (cdr a)))
  )
)

(defun pocet_atomu (a)
  (if 
    (eq a ())
    0
    (if 
      (atom (car a))
      (+ 1 (pocet_atomu (cdr a)))
      (+ (pocet_atomu (car a)) (pocet_atomu (cdr a)))
    )
  )
)

(defun spoj (a b)
  (if 
    (eq a ())
    b
    (cons (car a) (spoj (cdr a) b))
  )
)

(defun otoc (a)
  (if 
    (eq a ())
    a
    (spoj (otoc (cdr a)) (list (car a))) 
  )
)

(defun otoc_superior (a)
  (if 
    (eq a ())
    a
    (spoj 
      (otoc_superior (cdr a)) 
      (if 
        (atom (car a))
        (list (car a))
        (list (otoc_superior (car a)))
      ) 
    )
  )
)

(defun flatten (a)
  (if 
    (eq a ())
    a
    (if 
      (atom (car a))
      (cons (car a) (flatten (cdr a)))
      (flatten (spoj (car a) (cdr a)))
    )
  )
)

(defun fact (n)
  (if 
    (eq n 0)
    1
    (* (fact (- n 1)) n)
  )
)

(defun fib (n)
  (if 
    (eq n 1)
    1
    (if (eq n 2)
      1
      (+ (fib (rozdil n 1)) (fib (rozdil n 2)))
    )
  )
)

(defun prvek (a pos)
  (if (eq pos 0)
    (car a)
    (prvek (cdr a) (- pos 1))
  )
)

(defun median_helper (a len)
  (if 
    (oddp len)
    (prvek a (podil len 2))
    (/ (+ (prvek a (podil len 2)) (prvek a (- (podil len 2) 1))) 2)
  )
)

(defun median (a)
  (median_helper a (delka a))
)
