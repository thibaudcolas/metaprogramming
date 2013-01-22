; Inspecteur d'objets en CLOS
; ---------------------------------------------------------------------
; https://obfuscatedcode.wordpress.com/2005/07/29/pretty-printing-clos-objects/
; http://unknownlamer.org/muse/Metaobject%20Protocols.html#sec11
; https://github.com/emacsmirror/slime/blob/master/contrib/swank-fancy-inspector.lisp


(defgeneric example-inspect (instance)
  (:documentation "Simple object inspector using CLOS MOP"))

(defmethod example-inspect ((instance t))
  (format t "Simple Object~% Value: ~S~%" instance))

(defmethod example-inspect ((instance standard-object))
  (let ((class (class-of instance)))
    (format t "Class: ~S, Superclasses: ~S~%"
            (class-name class)
            (mapcar #'class-name
                    (class-precedence-list class)))
    (let ((slot-names (mapcar #'slot-definition-name
                              (class-slots class))))
      (format t "Slots: ~%~{ ~S~%~}" slot-names)
      (inspect-loop slot-names instance #'example-inspect))))

(defun inspect-loop (slots instance inspector)
  (format t "Enter slot to inspect or :pop to go up one level: ")
  (finish-output)
  (let* ((slot (read))
         (found-slot (member slot slots)))
    (cond (found-slot
           (funcall inspector (slot-value instance slot))
           (funcall inspector instance))
          ((eq slot :pop) t)
          (t
           (format t "~S is invalid. Valid slot names: ~S~%"
                   slot
                   slots)
           (inspect-loop slots instance inspector)))))


; Tests.
; ---------------------------------------------------------------------

(defclass polygone (standard-object)
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

(defclass quadrilatere(polygone)
  ((side-nb :allocation :class
            :initform 4))
  (:metaclass standard-class)
)
