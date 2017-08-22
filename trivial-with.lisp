(in-package #:trivial-with)
;;==============================================================================
;;
;; Recursively invoke on all things, building with-thing forms...
;;
(defmacro all ((&rest things) &body body)
  "Create nested with-... forms for all things"
  (let* ((package (symbol-package (caar things)))
	 (name (concatenate 'string "WITH-" (symbol-name (caar things))))
	 (symbol (find-symbol name package))
	 (remaining (cdr things)))
    (unless symbol  (error "with:all cannot find ~A" name))
    (if remaining
	`(,symbol ,@(cdar things)
		  (all ,remaining ,@body))
	`(,symbol ,@(cdar things)
		  ,@body))))


(defmacro side-effect (var &body body)
  `(setf ,var ,@body))
