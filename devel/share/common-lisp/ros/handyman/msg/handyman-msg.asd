
(cl:in-package :asdf)

(defsystem "handyman-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "HandymanMsg" :depends-on ("_package_HandymanMsg"))
    (:file "_package_HandymanMsg" :depends-on ("_package"))
  ))