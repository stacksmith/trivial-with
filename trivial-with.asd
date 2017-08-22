;;
;;
(asdf:defsystem #:trivial-with
  :description "Replace nested with-xxx invocations with a single with:all form"
  :author "StackSmith <fpgasm@apple2.x10.mx>"
  :license "BSD 3-clause license"
  :serial t
  :depends-on ()
  :components ((:file "package")
	       (:file "trivial-with")))

