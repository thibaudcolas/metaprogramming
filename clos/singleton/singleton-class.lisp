; Singleton : la classe des classes qui n'ont qu'une seule instance.
; ---------------------------------------------------------------------
; Avec l'aide de Tim Bradshaw : http://www.tfeb.org/lisp/hax.html#SINGLETON-CLASSES

(defclass singleton-class (standard-class)
  ; L'instance, par défaut nil.
  ((instance :initform nil))
  )

; Création des instances / initialisation.
; ---------------------------------------------------------------------

(defmethod make-instance ((class singleton-class) &key)
  (with-slots (instance) class
    ; Initialisation de l'instance si nécessaire.
    (or instance (setf instance (call-next-method)))
    )
  )

(defun reset-instance (class)
  (setf (slot-value (find-class class) 'instance) nil)
  )


; Méthodes de validation de l'héritage
; ---------------------------------------------------------------------

; singleton peut être superclasse de singleton.
(defmethod validate-superclass ((class singleton-class) (sup singleton-class)) t)
; standard-class peut être superclasse de singleton.
(defmethod validate-superclass ((class singleton-class) (sup standard-class)) t)
; standard-class ne peut pas être une sous-classe de singleton.
(defmethod validate-superclass ((class standard-class) (sup singleton-class)) nil)

; Tests.
; ---------------------------------------------------------------------

(defclass test ()
  ()
  (:metaclass singleton-class)
  )

(setf foo (make-instance 'test))
(setf bar (make-instance 'test))
(reset-instance 'test)
; Bizarrement, si fizz et buzz sont définis en dehors du fichier
; alors que foo et bar y sont, leurs instances seront différentes.
(setf fizz (make-instance 'test))
(setf buzz (make-instance 'test))

(defclass person ()
  ((name
    :accessor name
    :initform ""
    :initarg :name
    :reader to_s))
  (:metaclass singleton-class)
  )

; Différence entre setf et setq :
; (setq symbol value) Gives each variable symbol the value of the corresponding value expression.
; (setf place value) A generalization of setq : stores in the location associated with each place the value of the corresponding value expression.
; Plus d'infos : ANSI Common Lisp, Paul Graham.

(setq eve (make-instance `person :name `Eve))
(setq lea (make-instance `person :name `Lea))
