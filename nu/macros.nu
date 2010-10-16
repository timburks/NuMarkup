;;
;; global utilities
;;

;; this operator combines expressions without wrapping them in a tag.
;; use it where you might otherwise use +; it is more tolerant of NULLs.
(global && (NuMarkupOperator operatorWithTag:nil))

;;
;; macro to define markup operators
;; see xhtml.nu, rss.nu, etc. for examples
;;

;; generates operators for the provided names.
;; replaces - with : in the generated operators.
;; for example, "foo-bar" becomes &foo-bar,
;; which when used as (&foo-bar "x") writes <foo:bar>x</foo:bar>.
(macro markup (*names)
     `(progn
            (',*names each:
                 (do (name)
                     (set stringName ((name stringValue) stringByReplacingOccurrencesOfString:"-" withString:":"))
                     (set expression
                          (list 'global
                                ((+ "&" (name stringValue)) symbolValue)
                                '(NuMarkupOperator operatorWithTag:stringName)))
                     (eval expression)))))
