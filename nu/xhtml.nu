(global XMLNS "http://www.w3.org/1999/xhtml")

(set &html (NuMarkupOperator operatorWithTag:"html" prefix:<<-END
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
END contents:(list xmlns:XMLNS)))

(set &xhtml-transitional (NuMarkupOperator operatorWithTag:"html" prefix:<<-END
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
END contents:(list xmlns:XMLNS)))

(set &xhtml-strict (NuMarkupOperator operatorWithTag:"html" prefix:<<-END
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
END contents:(list xmlns:XMLNS)))

(macro markup (*names)
     `(progn
            (',*names each:
                 (do (name)
                     (set stringName (name stringValue))
                     (set expression
                          (list 'global ((+ "&" stringName) symbolValue) '(NuMarkupOperator operatorWithTag:stringName)))
                     (eval expression)))))

# add tags as needed
(markup a
	area
        body
        br
        button
        col
        div
        fieldset
        form
        head
        h1
        h2
        h3
        h4
        h5
        h6
        hr
        img
        input
        label
        li
        link
        meta
        ol
        option
        p
        pre
        script
        select
        span
        strong
        style
        table
        td
        textarea
        th
        title
        tr
        tbody
        ul)

(send &meta setEmpty:YES)
(send &link setEmpty:YES)
(send &hr setEmpty:YES)
(send &br setEmpty:YES)
(send &img setEmpty:YES)
(send &area setEmpty:YES)
(send &input setEmpty:YES)
(send &col setEmpty:YES)
