(defclass Boat (standard-object)
  (:metaclass standard-class)
  )
(defmethod initialize-instance ((o Boat) &rest args)
  (print `Boat)
  )

(defclass Day-boat (Boat)
  (:metaclass standard-class)
  )
(defmethod initialize-instance((o Day-boat) &rest args)
  (call-next-method)
  (print `Day-boat)
  )
  

(defclass Wheel-boat (Boat)
  (:metaclass standard-class)
  )
(defmethod initialize-instance ((o Wheel-boat) &rest args)
  (call-next-method)
  (print `Wheel-boat)
  )
  

(defclass Engine-less-boat (Day-boat Wheel-boat)
  (:metaclass standard-class)
  )
(defmethod initialize-instance ((o Engine-less-boat) &rest args)
  (call-next-method)
  (print `Engine-less-boat)
  )
  

(defclass Small-multihull (Day-boat)
  (:metaclass standard-class)
  )
(defmethod initialize-instance ((o Small-multihull) &rest args)
  (call-next-method)
  (print `Small-multihull)
  )
  

(defclass Small-catamaran (Small-multihull)
  (:metaclass standard-class)
  )
(defmethod initialize-instance ((o Small-catamaran) &rest args)
  (call-next-method)
  (print `Small-catamaran)
  )
  

(defclass Pedal-wheel-boat (Engine-less-boat Small-catamaran Wheel-boat)
  (:metaclass standard-class)
  )
(defmethod initialize-instance ((o Pedal-wheel-boat) &rest args)
  (call-next-method)
  (print `Pedal-wheel-boat)
  )
  
(defclass Pedalo (Pedal-wheel-boat Small-catamaran)
  (:metaclass standard-class)
  )
(defmethod initialize-instance ((o Pedalo) &rest args)
  (call-next-method)
  (print `Pedalo)
  )
  

(setq pedalo (make-instance `Pedalo))