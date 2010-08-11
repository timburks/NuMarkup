(set &rss (NuMarkupOperator operatorWithTag:"rss" prefix:<<-END
<?xml version="1.0" encoding="UTF-8"?>
END contents:(list)))

(macro markup (*names)
     `(progn
            (',*names each:
                 (do (name)
                     (set stringName (name stringValue))
                     (set expression
                          (list 'global ((+ "&" stringName) symbolValue) '(NuMarkupOperator operatorWithTag:stringName)))
                     (eval expression)))))

# add tags as needed
(markup channel
        title
        link
        language
        description
        item
        author
        pubDate
        guid
        description)
