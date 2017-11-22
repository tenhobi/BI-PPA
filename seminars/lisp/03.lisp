(defun volitelny (a b &optional (c 10) )
  (+ a b c)
)

(defun insert (i a c)
  (if 
    (eq a ())
    (list i)
    (if
      (funcall c i (car a))
      (cons i a)
      (cons (car a) (insert i (cdr a) c))
    )
  )
)

(defun insert-sort (a &optional (c '<))
  (if
    (eq a ())
    a
    (insert (car a) (insert-sort (cdr a) c) c)
  )
)

(defun shuffle (a)
  (insert-sort a (lambda (x y) (eq (random 2) 0)))
)

;---------------------------------

(defparameter *strom*
  '(5
    (3
      (1)
      (4)
    )
    (10
      (7
        (6)
        (8)
        (9)
      )
      (20
        nil
        (30)
      )
    )
  )
)

(defun jePrazdny (koren)
  (eq (car koren) ())
)

(defun jeList (uzel)
  (and (eq (levy uzel) ()) (eq (pravy uzel) ()))
)

(defun levy (uzel)
  (cadr uzel)
)

(defun pravy (uzel)
  (caddr uzel)
)

(defun prvek (a pos)
  (if (eq pos 0)
    (car a)
    (prvek (cdr a) (- pos 1))
  )
)

(defun nty (uzel i)
  (prvek uzel (+ i 1))
)

(defun hodnotaUzlu (uzel)
  (car uzel)
)

(defun vyska (koren)
  (if 
    (jePrazdny koren)
    0
    (+ 1 (max (vyska (levy koren)) (vyska (pravy koren))))
  )
)

(defun inOrder (koren)
  (if
    (jePrazdny koren)
    nil
    (append
      (inOrder (levy koren))
      (list (hodnotaUzlu koren))
      (inOrder (pravy koren))   
    )
  )
)

(defun inOrder2 (koren)
  (if
    (jePrazdny koren)
    nil
    (append
      (inOrder2 (levy koren))
      (cons (hodnotaUzlu koren) (inOrder2 (pravy koren)))
    )
  )
)

(defun preOrder (koren)
  (if
    (jePrazdny koren)
    nil
    (append
      (list (hodnotaUzlu koren))
      (inOrder (levy koren))
      (inOrder (pravy koren))   
    )
  )
)

(defun postOrder (koren)
  (if
    (jePrazdny koren)
    nil
    (append
      (inOrder (levy koren))
      (inOrder (pravy koren))  
      (list (hodnotaUzlu koren)) 
    )
  )
)

;---------------------------------

(defparameter *matice*
  '(
    (1 2 3)
    (4 5 6)
    (7 8 9)
  )
)

(defun delka (a)
  (if 
    (eq a ())
    0
    (+ 1 (delka (cdr a)))
  )
)

(defun rozmer (m)
  (cons (delka m) (delka (car m)))
)

(defun radek (m i)
  (prvek m i)
)

(defun sloupec (m i)
  (mapcar (lambda (radek) (prvek radek i)) m)
)

;---------------------------------

(defun vyska2 (koren)
  (if 
    (jePrazdny koren)
    0
    (+ 1 (apply 'max 0 (mapcar 'vyska2 (cdr koren))))
  )
)
