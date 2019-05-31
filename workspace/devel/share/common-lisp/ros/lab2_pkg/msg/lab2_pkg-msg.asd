
(cl:in-package :asdf)

(defsystem "lab2_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Vector3" :depends-on ("_package_Vector3"))
    (:file "_package_Vector3" :depends-on ("_package"))
    (:file "rawTwist" :depends-on ("_package_rawTwist"))
    (:file "_package_rawTwist" :depends-on ("_package"))
    (:file "Vector3" :depends-on ("_package_Vector3"))
    (:file "_package_Vector3" :depends-on ("_package"))
    (:file "rawTwist" :depends-on ("_package_rawTwist"))
    (:file "_package_rawTwist" :depends-on ("_package"))
  ))