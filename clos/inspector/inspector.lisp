; Inspecteur d'objets en CLOS
; ---------------------------------------------------------------------
; https://obfuscatedcode.wordpress.com/2005/07/29/pretty-printing-clos-objects/
; http://unknownlamer.org/muse/Metaobject%20Protocols.html#sec11


; Définition d'une méthode qui affiche la valeur d'un Simple Object (valeur littérale).
(defmethod inspect-object ((instance t))
  (format t "Simple Object~% Value: ~S~%" instance)
  )

; La inspect-object principale parcours les slots d'un standard-object.
(defmethod inspect-object ((instance standard-object))
  ; Récupération de la classe de notre instance.
  (let ((klass (class-of instance)))
    (format t "Class: ~S > Superclasses: ~S~%"
      (class-name klass)
      ; class-precedence-list renvoit la liste des classes précédant klass dans la hiérarchie.
      ; (mapcar function prolist)
      ; Comme map, exécute la fonction class-name sur tous les éléments de class-precedence-list klass — If the shortest prolist has n elements, calls function n times: first on the first element of each prolist, and last on the «th element of each prolist. Returns a list of the values returned by function.
      ; ANSI Common Lisp Paul Graham
      (mapcar #'class-name (class-precedence-list klass))
      )
    ; Encore une fois, mapcar appelle slot-definition-name sur chaque slot de klass
    (let ((all-slots (mapcar #'slot-definition-name (class-slots klass))))
      (format t "Slots: ~%~{ ~S~%~}" all-slots)
      ; Après avoir imprimé tous les slots, on appelle l'exploration du niveau suivant (récursion).
      (deeper all-slots instance))
    )
  )

; Deeper : creuse dans les slots de l'instance précédente.
(defun deeper (all-slots instance)
  (format t "Slot to inspect: ")
  ; finish-output permet de saisir un mot avec le read suivant : Forces out any buffered output on stream, then returns n i l .
  (finish-output)
  ; choice = read : valeur saisie par l'utilisateur.
  (let* ((choice (read)))
    ; Si choice appartient à la liste des slots.
    (cond ((member choice all-slots)
      ; On appelle inspect-object sur la valeur du slot choice.
      (funcall #'inspect-object (slot-value instance choice))))
    )
  )


; Tests.
; ---------------------------------------------------------------------

; Polygone : classe "abstraite".
(defclass polygon (standard-object)
  (
   (list-angles :initarg :angles
                :accessor poly-angles)
   (list-sides  :initarg :sides
                :accessor poly-sides)
   (side-nb     :accessor poly-nb)
   (angles-sum  :accessor poly-angles-sum)
  )
  (:metaclass standard-class)
)

; Triangle : polygone à trois angles.
(defclass triangle (polygon)
  (
    (side-nb :allocation :class
            :initform 3)
    (list-sides :allocation :class
            :initform ())
    (list-angles :allocation :class
            :initform '(1 2 3))
    )
  (:metaclass standard-class)
)

(defclass triangle-rectangle (triangle)
  (
    (side-nb :allocation :class
            :initform 3)
    (list-sides :allocation :class
            :initform ())
    (list-angles :allocation :class
            :initform '(1 2 42))
    )
  (:metaclass standard-class)
)

(setq rect (make-instance 'triangle-rectangle))

(defclass multidimension (standard-object)
  ((dimension :initform rect))
  (:metaclass standard-class)
)

(setq ex (make-instance 'triangle-rectangle))

(setq weird (make-instance 'multidimension))

(inspect-object weird)
