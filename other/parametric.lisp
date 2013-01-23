(defclass object[T](standard-object)
  ()
  (:metaclass standard-class)
)

(defclass class[T](standard-class)
  (
   (parametric-type :accessor pile-parametric-type
		    :initform nil)
  )
)

(defmethod make-parametric-instance1 ((c class[T]) (tt standard-class))
  (let ((x (make-instance c)))
    (setf (pile-parametric-type c) tt)
    x
   )
)

(defmethod make-parametric-instance(p tt)
  (make-parametric-instance1 (find-class p) (find-class tt))
)

(defmethod parametric-type-p (val class type)
  (and (eq (class-of val) (find-class pileclass))
       (eq (pile-parametric-type (find-class class)) (find-class type)))
)

(defmethod check((po object[T]) (so standard-object))
  (eq (pile-parametric-type (class-of po)) (class-of so))
)

(defclass pile-object(object[T])
  ()
  (:metaclass class[T])
)


(defclass pile-class(class[T])
  ((content :accessor stack-content
	          :initform nil)
   )
)

(defmethod popp((add standard-object) (po pile-object))
 (if (check po add)
     (setf (stack-content (class-of po)) (cons add (stack-content (class-of po)))))
)

(defmethod pushh((out standard-object) (po pile-object))
 (if (check po out)
     (delete out (stack-content (class-of po))))
)

(defclass pile1(pile-object)
  ()
  (:metaclass pile-class)
)

(defclass pile2(pile-object)
  ()
  (:metaclass pile-class)
)

(defclass personne()
  ()
)

(setq pile1 (make-parametric-instance 'pile1 'personne))
(setq person1 (make-instance 'personne))
(setq person2 (make-instance 'personne))

