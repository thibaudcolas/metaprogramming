; Inspecteur d'objets en CLOS
; ---------------------------------------------------------------------
; https://obfuscatedcode.wordpress.com/2005/07/29/pretty-printing-clos-objects/
; http://unknownlamer.org/muse/Metaobject%20Protocols.html#sec11
; https://github.com/emacsmirror/slime/blob/master/contrib/swank-fancy-inspector.lisp

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
