;;
;; macro to define markup operators
;; see xhtml.nu, rss.nu, etc. for examples
;; 
(macro markup (*names)
     `(progn
            (',*names each:
                 (do (name)
                     (set stringName (name stringValue))
                     (set expression
                          (list 'global
                                ((+ "&" stringName) symbolValue)
                                '(NuMarkupOperator operatorWithTag:stringName)))
                     (eval expression)))))
